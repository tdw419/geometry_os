; DESCRIPTION: Places a white 70x54 rectangle at position (348, 163).
; PLAN: r0=348(x), r1=163(y), r2=70(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 163
LDI r2, 70
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
