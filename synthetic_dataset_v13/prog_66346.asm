; DESCRIPTION: Draws a cyan rectangle at (371, 146) with width 117 and height 96.
; PLAN: r0=371(x), r1=146(y), r2=117(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 146
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
