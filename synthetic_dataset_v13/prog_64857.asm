; DESCRIPTION: Draws a black rectangle at (242, 114) with width 71 and height 113.
; PLAN: r0=242(x), r1=114(y), r2=71(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 114
LDI r2, 71
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
