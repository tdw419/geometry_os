; DESCRIPTION: Renders a white box of size 86x53 starting at (231, 99).
; PLAN: r0=231(x), r1=99(y), r2=86(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 99
LDI r2, 86
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
