; DESCRIPTION: Places a red 12x106 rectangle at position (407, 29).
; PLAN: r0=407(x), r1=29(y), r2=12(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 29
LDI r2, 12
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
