; DESCRIPTION: Composite: Renders a green box of size 12x80 starting at (333, 88) then Places a cyan dot at position (263, 98) then Places a green circle of radius 25 at center (351, 200).
; PLAN: r0=333(x), r1=88(y), r2=12(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=200(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 88
LDI r2, 12
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 200
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
