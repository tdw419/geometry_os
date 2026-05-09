; DESCRIPTION: Draws a black rectangle at (242, 118) with width 85 and height 85.
; PLAN: r0=242(x), r1=118(y), r2=85(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 118
LDI r2, 85
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
