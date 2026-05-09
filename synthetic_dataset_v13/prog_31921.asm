; DESCRIPTION: Places a purple 16x76 rectangle at position (75, 72).
; PLAN: r0=75(x), r1=72(y), r2=16(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 72
LDI r2, 16
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
