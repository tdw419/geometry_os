; DESCRIPTION: Composite: Places a red dot at position (138, 87) then Renders a red line between points (319, 22) and (149, 213) then Places a magenta 40x20 rectangle at position (305, 48).
; PLAN: r0=138(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=22(y1), r7=149(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=48(y), r12=40(width), r13=20(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 319
LDI r6, 22
LDI r7, 149
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 48
LDI r12, 40
LDI r13, 20
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
