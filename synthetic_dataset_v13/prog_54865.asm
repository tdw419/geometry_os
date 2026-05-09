; DESCRIPTION: Renders a black box of size 47x94 starting at (37, 94).
; PLAN: r0=37(x), r1=94(y), r2=47(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 94
LDI r2, 47
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
