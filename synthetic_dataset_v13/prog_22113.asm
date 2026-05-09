; DESCRIPTION: Places a red 58x19 rectangle at position (191, 109).
; PLAN: r0=191(x), r1=109(y), r2=58(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 109
LDI r2, 58
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
