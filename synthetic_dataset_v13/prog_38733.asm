; DESCRIPTION: Renders a green box of size 120x34 starting at (60, 66).
; PLAN: r0=60(x), r1=66(y), r2=120(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 66
LDI r2, 120
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
