; DESCRIPTION: Places a white 56x19 rectangle at position (358, 236).
; PLAN: r0=358(x), r1=236(y), r2=56(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 236
LDI r2, 56
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
