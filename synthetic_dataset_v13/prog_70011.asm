; DESCRIPTION: Places a red 62x26 rectangle at position (125, 172).
; PLAN: r0=125(x), r1=172(y), r2=62(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 172
LDI r2, 62
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
