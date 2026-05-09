; DESCRIPTION: Places a purple 10x41 rectangle at position (266, 52).
; PLAN: r0=266(x), r1=52(y), r2=10(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 52
LDI r2, 10
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
