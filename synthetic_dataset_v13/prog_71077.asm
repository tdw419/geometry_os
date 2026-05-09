; DESCRIPTION: Composite: Places a green line segment connecting (104, 164) to (465, 155) then Places a purple 52x102 rectangle at position (68, 22).
; PLAN: r0=104(x1), r1=164(y1), r2=465(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=22(y), r7=52(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 164
LDI r2, 465
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 22
LDI r7, 52
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
