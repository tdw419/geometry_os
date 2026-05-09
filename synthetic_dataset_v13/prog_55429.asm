; DESCRIPTION: Places a black 27x76 rectangle at position (26, 6).
; PLAN: r0=26(x), r1=6(y), r2=27(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 6
LDI r2, 27
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
