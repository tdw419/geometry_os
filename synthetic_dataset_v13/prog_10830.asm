; DESCRIPTION: Places a red 30x52 rectangle at position (148, 140).
; PLAN: r0=148(x), r1=140(y), r2=30(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 140
LDI r2, 30
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
