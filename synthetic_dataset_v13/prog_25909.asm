; DESCRIPTION: Draws a white rectangle at (164, 146) with width 49 and height 93.
; PLAN: r0=164(x), r1=146(y), r2=49(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 146
LDI r2, 49
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
