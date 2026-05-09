; DESCRIPTION: Places a orange 95x118 rectangle at position (384, 10).
; PLAN: r0=384(x), r1=10(y), r2=95(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 10
LDI r2, 95
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
