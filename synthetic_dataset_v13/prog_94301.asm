; DESCRIPTION: Draws a black rectangle at (146, 121) with width 85 and height 48.
; PLAN: r0=146(x), r1=121(y), r2=85(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 121
LDI r2, 85
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
