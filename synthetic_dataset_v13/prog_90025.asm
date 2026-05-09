; DESCRIPTION: Draws a black rectangle at (242, 60) with width 34 and height 102.
; PLAN: r0=242(x), r1=60(y), r2=34(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 60
LDI r2, 34
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
