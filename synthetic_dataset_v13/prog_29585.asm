; DESCRIPTION: Draws a black rectangle at (206, 146) with width 107 and height 77.
; PLAN: r0=206(x), r1=146(y), r2=107(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 146
LDI r2, 107
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
