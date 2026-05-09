; DESCRIPTION: Places a white 77x24 rectangle at position (183, 14).
; PLAN: r0=183(x), r1=14(y), r2=77(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 14
LDI r2, 77
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
