; DESCRIPTION: Composite: Places a purple line segment connecting (372, 206) to (167, 96) then Places a cyan dot at position (205, 88).
; PLAN: r0=372(x1), r1=206(y1), r2=167(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 206
LDI r2, 167
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
