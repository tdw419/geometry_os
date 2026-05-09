; DESCRIPTION: Draws a black rectangle at (372, 146) with width 27 and height 81.
; PLAN: r0=372(x), r1=146(y), r2=27(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 146
LDI r2, 27
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
