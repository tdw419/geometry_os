; DESCRIPTION: Composite: Draws a black line from (378, 245) to (211, 224) then Places a yellow 49x110 rectangle at position (358, 134).
; PLAN: r0=378(x1), r1=245(y1), r2=211(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=134(y), r7=49(width), r8=110(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 245
LDI r2, 211
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 134
LDI r7, 49
LDI r8, 110
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
