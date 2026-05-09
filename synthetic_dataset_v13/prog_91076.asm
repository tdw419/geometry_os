; DESCRIPTION: Places a white 72x35 rectangle at position (276, 24).
; PLAN: r0=276(x), r1=24(y), r2=72(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 24
LDI r2, 72
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
