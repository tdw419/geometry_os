; DESCRIPTION: Renders a white box of size 117x98 starting at (10, 87).
; PLAN: r0=10(x), r1=87(y), r2=117(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 87
LDI r2, 117
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
