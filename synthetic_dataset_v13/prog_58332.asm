; DESCRIPTION: Draws a cyan rectangle at (191, 146) with width 53 and height 79.
; PLAN: r0=191(x), r1=146(y), r2=53(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 146
LDI r2, 53
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
