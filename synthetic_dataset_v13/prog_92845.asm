; DESCRIPTION: Composite: Renders a purple box of size 95x83 starting at (411, 132) then Places a purple line segment connecting (227, 154) to (361, 46).
; PLAN: r0=411(x), r1=132(y), r2=95(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=154(y1), r7=361(x2), r8=46(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 132
LDI r2, 95
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 154
LDI r7, 361
LDI r8, 46
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
