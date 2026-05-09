; DESCRIPTION: Places a red 11x68 rectangle at position (253, 148).
; PLAN: r0=253(x), r1=148(y), r2=11(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 148
LDI r2, 11
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
