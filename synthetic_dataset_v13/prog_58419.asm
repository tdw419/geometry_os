; DESCRIPTION: Places a white 108x40 rectangle at position (358, 156).
; PLAN: r0=358(x), r1=156(y), r2=108(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 156
LDI r2, 108
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
