; DESCRIPTION: Composite: Places a purple line segment connecting (368, 87) to (374, 244) then Places a green dot at position (153, 8).
; PLAN: r0=368(x1), r1=87(y1), r2=374(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 87
LDI r2, 374
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
