; DESCRIPTION: Composite: Renders a black disk with center (206, 164) and radius 64 then Places a magenta line segment connecting (260, 142) to (351, 35).
; PLAN: r0=206(x), r1=164(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=142(y1), r7=351(x2), r8=35(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 164
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 142
LDI r7, 351
LDI r8, 35
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
