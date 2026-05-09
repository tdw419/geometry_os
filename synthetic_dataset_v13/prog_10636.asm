; DESCRIPTION: Draws a black rectangle at (94, 107) with width 73 and height 120.
; PLAN: r0=94(x), r1=107(y), r2=73(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 107
LDI r2, 73
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
