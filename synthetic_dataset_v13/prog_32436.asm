; DESCRIPTION: Places a purple 41x60 rectangle at position (217, 164).
; PLAN: r0=217(x), r1=164(y), r2=41(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 164
LDI r2, 41
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
