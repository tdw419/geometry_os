; DESCRIPTION: Composite: Places a green dot at position (319, 217) then Renders a red box of size 87x69 starting at (168, 144) then Renders a yellow line between points (487, 144) and (20, 59).
; PLAN: r0=319(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=144(y), r7=87(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=487(x1), r11=144(y1), r12=20(x2), r13=59(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 168
LDI r6, 144
LDI r7, 87
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 144
LDI r12, 20
LDI r13, 59
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
