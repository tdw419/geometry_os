; DESCRIPTION: Places a white 118x26 rectangle at position (249, 144).
; PLAN: r0=249(x), r1=144(y), r2=118(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 144
LDI r2, 118
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
