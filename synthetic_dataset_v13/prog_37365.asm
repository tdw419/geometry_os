; DESCRIPTION: Composite: Draws a black line from (207, 8) to (27, 191) then Places a purple 29x118 rectangle at position (275, 55).
; PLAN: r0=207(x1), r1=8(y1), r2=27(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=55(y), r7=29(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 8
LDI r2, 27
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 55
LDI r7, 29
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
