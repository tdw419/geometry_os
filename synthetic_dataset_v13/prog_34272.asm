; DESCRIPTION: Places a white 81x41 rectangle at position (374, 168).
; PLAN: r0=374(x), r1=168(y), r2=81(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 168
LDI r2, 81
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
