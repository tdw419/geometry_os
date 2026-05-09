; DESCRIPTION: Places a white 57x84 rectangle at position (289, 113).
; PLAN: r0=289(x), r1=113(y), r2=57(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 113
LDI r2, 57
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
