; DESCRIPTION: Places a red 11x98 rectangle at position (233, 127).
; PLAN: r0=233(x), r1=127(y), r2=11(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 127
LDI r2, 11
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
