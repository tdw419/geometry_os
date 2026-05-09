; DESCRIPTION: Renders a white box of size 91x117 starting at (231, 5).
; PLAN: r0=231(x), r1=5(y), r2=91(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 5
LDI r2, 91
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
