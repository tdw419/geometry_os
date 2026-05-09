; DESCRIPTION: Composite: Renders a yellow box of size 60x11 starting at (332, 64) then Places a black line segment connecting (263, 97) to (296, 13).
; PLAN: r0=332(x), r1=64(y), r2=60(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=97(y1), r7=296(x2), r8=13(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 64
LDI r2, 60
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 97
LDI r7, 296
LDI r8, 13
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
