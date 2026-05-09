; DESCRIPTION: Composite: Places a magenta 64x37 rectangle at position (4, 51) then Places a purple line segment connecting (298, 120) to (230, 157).
; PLAN: r0=4(x), r1=51(y), r2=64(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=120(y1), r7=230(x2), r8=157(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 51
LDI r2, 64
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 120
LDI r7, 230
LDI r8, 157
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
