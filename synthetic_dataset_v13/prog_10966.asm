; DESCRIPTION: Places a yellow 118x81 rectangle at position (117, 125).
; PLAN: r0=117(x), r1=125(y), r2=118(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 125
LDI r2, 118
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
