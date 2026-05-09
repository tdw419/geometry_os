; DESCRIPTION: Places a white 73x117 rectangle at position (125, 118).
; PLAN: r0=125(x), r1=118(y), r2=73(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 118
LDI r2, 73
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
