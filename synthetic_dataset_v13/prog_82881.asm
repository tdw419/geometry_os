; DESCRIPTION: Places a black 41x103 rectangle at position (420, 103).
; PLAN: r0=420(x), r1=103(y), r2=41(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 103
LDI r2, 41
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
