; DESCRIPTION: Places a white 50x41 rectangle at position (337, 50).
; PLAN: r0=337(x), r1=50(y), r2=50(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 50
LDI r2, 50
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
