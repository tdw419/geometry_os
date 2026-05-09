; DESCRIPTION: Places a white 43x15 rectangle at position (338, 8).
; PLAN: r0=338(x), r1=8(y), r2=43(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 8
LDI r2, 43
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
