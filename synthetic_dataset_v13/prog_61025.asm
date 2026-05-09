; DESCRIPTION: Places a white 77x109 rectangle at position (7, 30).
; PLAN: r0=7(x), r1=30(y), r2=77(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 30
LDI r2, 77
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
