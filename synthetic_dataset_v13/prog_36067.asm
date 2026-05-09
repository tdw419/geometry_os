; DESCRIPTION: Renders a green box of size 74x30 starting at (321, 16).
; PLAN: r0=321(x), r1=16(y), r2=74(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 16
LDI r2, 74
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
