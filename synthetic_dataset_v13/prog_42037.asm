; DESCRIPTION: Draws a black rectangle at (242, 24) with width 98 and height 111.
; PLAN: r0=242(x), r1=24(y), r2=98(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 24
LDI r2, 98
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
