; DESCRIPTION: Places a white 18x43 rectangle at position (176, 107).
; PLAN: r0=176(x), r1=107(y), r2=18(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 107
LDI r2, 18
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
