; DESCRIPTION: Places a white 35x14 rectangle at position (381, 144).
; PLAN: r0=381(x), r1=144(y), r2=35(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 144
LDI r2, 35
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
