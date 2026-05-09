; DESCRIPTION: Places a white 78x96 rectangle at position (33, 64).
; PLAN: r0=33(x), r1=64(y), r2=78(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 64
LDI r2, 78
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
