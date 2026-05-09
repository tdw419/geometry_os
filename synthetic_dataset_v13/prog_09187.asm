; DESCRIPTION: Places a white 64x56 rectangle at position (399, 77).
; PLAN: r0=399(x), r1=77(y), r2=64(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 77
LDI r2, 64
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
