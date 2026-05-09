; DESCRIPTION: Places a white 43x18 rectangle at position (358, 166).
; PLAN: r0=358(x), r1=166(y), r2=43(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 166
LDI r2, 43
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
