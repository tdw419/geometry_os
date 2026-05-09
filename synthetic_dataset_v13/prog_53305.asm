; DESCRIPTION: Places a white 87x41 rectangle at position (19, 192).
; PLAN: r0=19(x), r1=192(y), r2=87(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 192
LDI r2, 87
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
