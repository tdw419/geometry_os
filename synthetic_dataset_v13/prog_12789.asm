; DESCRIPTION: Places a yellow 52x72 rectangle at position (207, 168).
; PLAN: r0=207(x), r1=168(y), r2=52(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 168
LDI r2, 52
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
