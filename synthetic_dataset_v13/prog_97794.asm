; DESCRIPTION: Places a white 60x120 rectangle at position (237, 41).
; PLAN: r0=237(x), r1=41(y), r2=60(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 41
LDI r2, 60
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
