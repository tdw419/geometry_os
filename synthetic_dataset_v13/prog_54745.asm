; DESCRIPTION: Places a red 77x79 rectangle at position (261, 32).
; PLAN: r0=261(x), r1=32(y), r2=77(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 32
LDI r2, 77
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
