; DESCRIPTION: Draws a cyan rectangle at (393, 146) with width 29 and height 103.
; PLAN: r0=393(x), r1=146(y), r2=29(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 146
LDI r2, 29
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
