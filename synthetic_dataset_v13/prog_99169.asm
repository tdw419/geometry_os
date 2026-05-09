; DESCRIPTION: Places a purple 10x46 rectangle at position (365, 194).
; PLAN: r0=365(x), r1=194(y), r2=10(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 194
LDI r2, 10
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
