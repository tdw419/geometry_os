; DESCRIPTION: Places a blue 45x41 rectangle at position (48, 80).
; PLAN: r0=48(x), r1=80(y), r2=45(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 80
LDI r2, 45
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
