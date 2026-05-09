; DESCRIPTION: Renders a green box of size 97x60 starting at (161, 131).
; PLAN: r0=161(x), r1=131(y), r2=97(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 131
LDI r2, 97
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
