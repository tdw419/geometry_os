; DESCRIPTION: Places a red 52x34 rectangle at position (66, 191).
; PLAN: r0=66(x), r1=191(y), r2=52(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 191
LDI r2, 52
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
