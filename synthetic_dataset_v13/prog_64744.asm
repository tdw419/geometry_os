; DESCRIPTION: Composite: Renders a green box of size 31x92 starting at (151, 158) then Renders a cyan disk with center (238, 113) and radius 77 then Renders a orange line between points (137, 211) and (111, 238).
; PLAN: r0=151(x), r1=158(y), r2=31(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=113(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=211(y1), r12=111(x2), r13=238(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 158
LDI r2, 31
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 113
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 211
LDI r12, 111
LDI r13, 238
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
