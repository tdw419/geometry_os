; DESCRIPTION: Draws a black rectangle at (142, 146) with width 64 and height 79.
; PLAN: r0=142(x), r1=146(y), r2=64(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 146
LDI r2, 64
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
