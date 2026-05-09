; DESCRIPTION: Renders a green box of size 18x34 starting at (323, 31).
; PLAN: r0=323(x), r1=31(y), r2=18(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 31
LDI r2, 18
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
