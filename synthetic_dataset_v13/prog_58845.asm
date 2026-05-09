; DESCRIPTION: Places a black 48x32 rectangle at position (429, 119).
; PLAN: r0=429(x), r1=119(y), r2=48(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 119
LDI r2, 48
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
