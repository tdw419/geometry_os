; DESCRIPTION: Draws a cyan rectangle at (369, 132) with width 64 and height 53.
; PLAN: r0=369(x), r1=132(y), r2=64(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 132
LDI r2, 64
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
