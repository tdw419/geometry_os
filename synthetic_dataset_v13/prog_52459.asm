; DESCRIPTION: Places a green 79x70 rectangle at position (348, 33).
; PLAN: r0=348(x), r1=33(y), r2=79(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 33
LDI r2, 79
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
