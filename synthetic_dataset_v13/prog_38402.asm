; DESCRIPTION: Places a purple 119x41 rectangle at position (251, 127).
; PLAN: r0=251(x), r1=127(y), r2=119(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 127
LDI r2, 119
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
