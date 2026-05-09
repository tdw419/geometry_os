; DESCRIPTION: Renders a green box of size 98x115 starting at (8, 44).
; PLAN: r0=8(x), r1=44(y), r2=98(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 44
LDI r2, 98
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
