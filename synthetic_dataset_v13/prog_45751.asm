; DESCRIPTION: Places a purple 24x76 rectangle at position (157, 10).
; PLAN: r0=157(x), r1=10(y), r2=24(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 10
LDI r2, 24
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
