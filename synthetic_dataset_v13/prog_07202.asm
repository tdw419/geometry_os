; DESCRIPTION: Composite: Draws a purple circle centered at (353, 115) with radius 43 then Renders a cyan line between points (227, 207) and (305, 6).
; PLAN: r0=353(x), r1=115(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=207(y1), r7=305(x2), r8=6(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 115
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 207
LDI r7, 305
LDI r8, 6
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
