; DESCRIPTION: Places a red 62x80 rectangle at position (15, 138).
; PLAN: r0=15(x), r1=138(y), r2=62(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 138
LDI r2, 62
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
