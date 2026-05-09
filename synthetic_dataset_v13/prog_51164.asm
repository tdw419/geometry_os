; DESCRIPTION: Composite: Places a purple dot at position (291, 161) then Places a purple 85x58 rectangle at position (79, 87).
; PLAN: r0=291(x), r1=161(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=87(y), r7=85(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 161
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 87
LDI r7, 85
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
