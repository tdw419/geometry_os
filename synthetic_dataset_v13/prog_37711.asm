; DESCRIPTION: Places a blue 41x46 rectangle at position (343, 48).
; PLAN: r0=343(x), r1=48(y), r2=41(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 48
LDI r2, 41
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
