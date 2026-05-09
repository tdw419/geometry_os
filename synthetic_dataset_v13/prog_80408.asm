; DESCRIPTION: Places a purple 24x87 rectangle at position (458, 159).
; PLAN: r0=458(x), r1=159(y), r2=24(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 159
LDI r2, 24
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
