; DESCRIPTION: Composite: Renders a magenta line between points (503, 110) and (218, 149) then Draws a black rectangle at (125, 64) with width 58 and height 17.
; PLAN: r0=503(x1), r1=110(y1), r2=218(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=64(y), r7=58(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 110
LDI r2, 218
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 64
LDI r7, 58
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
