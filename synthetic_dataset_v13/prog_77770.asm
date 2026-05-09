; DESCRIPTION: Places a blue 71x41 rectangle at position (5, 44).
; PLAN: r0=5(x), r1=44(y), r2=71(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 44
LDI r2, 71
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
