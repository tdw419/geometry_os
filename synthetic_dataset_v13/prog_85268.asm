; DESCRIPTION: Places a white 75x21 rectangle at position (358, 39).
; PLAN: r0=358(x), r1=39(y), r2=75(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 39
LDI r2, 75
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
