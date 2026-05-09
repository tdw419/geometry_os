; DESCRIPTION: Places a white 26x76 rectangle at position (87, 166).
; PLAN: r0=87(x), r1=166(y), r2=26(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 166
LDI r2, 26
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
