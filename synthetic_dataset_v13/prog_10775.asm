; DESCRIPTION: Places a black 119x23 rectangle at position (299, 146).
; PLAN: r0=299(x), r1=146(y), r2=119(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 146
LDI r2, 119
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
