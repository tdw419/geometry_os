; DESCRIPTION: Places a white 60x57 rectangle at position (358, 122).
; PLAN: r0=358(x), r1=122(y), r2=60(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 122
LDI r2, 60
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
