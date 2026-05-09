; DESCRIPTION: Draws a green rectangle at (98, 103) with width 32 and height 18.
; PLAN: r0=98(x), r1=103(y), r2=32(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 103
LDI r2, 32
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
