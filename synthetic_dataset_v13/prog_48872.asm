; DESCRIPTION: Places a white 74x40 rectangle at position (170, 128).
; PLAN: r0=170(x), r1=128(y), r2=74(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 128
LDI r2, 74
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
