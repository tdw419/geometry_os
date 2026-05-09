; DESCRIPTION: Places a yellow 102x12 rectangle at position (52, 207).
; PLAN: r0=52(x), r1=207(y), r2=102(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 207
LDI r2, 102
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
