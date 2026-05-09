; DESCRIPTION: Places a white 15x96 rectangle at position (9, 101).
; PLAN: r0=9(x), r1=101(y), r2=15(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 101
LDI r2, 15
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
