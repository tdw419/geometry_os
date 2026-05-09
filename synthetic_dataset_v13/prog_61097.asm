; DESCRIPTION: Composite: Places a purple 114x113 rectangle at position (8, 99) then Places a purple dot at position (105, 137).
; PLAN: r0=8(x), r1=99(y), r2=114(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=137(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 99
LDI r2, 114
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 137
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
