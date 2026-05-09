; DESCRIPTION: Places a white 74x80 rectangle at position (324, 118).
; PLAN: r0=324(x), r1=118(y), r2=74(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 118
LDI r2, 74
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
