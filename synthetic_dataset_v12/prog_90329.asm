; DESCRIPTION: Renders a black box of size 118x47 starting at (60, 1).
; PLAN: r0=60(x), r1=1(y), r2=118(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 1
LDI r2, 118
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
