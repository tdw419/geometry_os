; DESCRIPTION: Places a green 97x102 rectangle at position (285, 148).
; PLAN: r0=285(x), r1=148(y), r2=97(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 148
LDI r2, 97
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
