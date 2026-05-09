; DESCRIPTION: Draws a cyan rectangle at (198, 178) with width 73 and height 53.
; PLAN: r0=198(x), r1=178(y), r2=73(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 178
LDI r2, 73
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
