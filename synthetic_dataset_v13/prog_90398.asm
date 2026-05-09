; DESCRIPTION: Composite: Creates a white circular shape at (420, 164) with radius 73 then Draws a black line from (427, 128) to (269, 5).
; PLAN: r0=420(x), r1=164(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=128(y1), r7=269(x2), r8=5(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 164
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 128
LDI r7, 269
LDI r8, 5
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
