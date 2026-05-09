; DESCRIPTION: Composite: Sets a single white pixel at (360, 242) then Renders a red box of size 40x63 starting at (206, 166) then Renders a green line between points (136, 108) and (4, 20).
; PLAN: r0=360(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=166(y), r7=40(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x1), r11=108(y1), r12=4(x2), r13=20(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 166
LDI r7, 40
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 108
LDI r12, 4
LDI r13, 20
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
