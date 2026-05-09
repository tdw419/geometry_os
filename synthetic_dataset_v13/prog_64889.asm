; DESCRIPTION: Places a white 81x107 rectangle at position (253, 6).
; PLAN: r0=253(x), r1=6(y), r2=81(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 6
LDI r2, 81
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
