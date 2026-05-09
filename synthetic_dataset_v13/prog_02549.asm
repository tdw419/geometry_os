; DESCRIPTION: Draws a red rectangle at (242, 118) with width 54 and height 110.
; PLAN: r0=242(x), r1=118(y), r2=54(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 118
LDI r2, 54
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
