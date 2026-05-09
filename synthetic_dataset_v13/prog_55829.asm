; DESCRIPTION: Composite: Renders a yellow line between points (503, 216) and (73, 238) then Creates a blue rectangular region at (263, 30) spanning 84 by 40 pixels.
; PLAN: r0=503(x1), r1=216(y1), r2=73(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=30(y), r7=84(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 216
LDI r2, 73
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 30
LDI r7, 84
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
