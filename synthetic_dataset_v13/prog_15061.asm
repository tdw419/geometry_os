; DESCRIPTION: Renders a black box of size 120x44 starting at (24, 110).
; PLAN: r0=24(x), r1=110(y), r2=120(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 110
LDI r2, 120
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
