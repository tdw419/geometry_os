; DESCRIPTION: Places a green 102x29 rectangle at position (285, 52).
; PLAN: r0=285(x), r1=52(y), r2=102(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 52
LDI r2, 102
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
