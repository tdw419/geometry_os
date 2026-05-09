; DESCRIPTION: Renders a green box of size 21x89 starting at (23, 100).
; PLAN: r0=23(x), r1=100(y), r2=21(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 100
LDI r2, 21
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
