; DESCRIPTION: Renders a black box of size 17x47 starting at (360, 118).
; PLAN: r0=360(x), r1=118(y), r2=17(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 118
LDI r2, 17
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
