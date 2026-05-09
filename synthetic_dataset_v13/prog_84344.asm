; DESCRIPTION: Places a red 71x94 rectangle at position (188, 125).
; PLAN: r0=188(x), r1=125(y), r2=71(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 125
LDI r2, 71
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
