; DESCRIPTION: Places a white 60x41 rectangle at position (277, 12).
; PLAN: r0=277(x), r1=12(y), r2=60(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 12
LDI r2, 60
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
