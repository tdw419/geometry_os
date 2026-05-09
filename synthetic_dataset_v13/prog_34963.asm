; DESCRIPTION: Places a red 31x12 rectangle at position (52, 125).
; PLAN: r0=52(x), r1=125(y), r2=31(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 125
LDI r2, 31
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
