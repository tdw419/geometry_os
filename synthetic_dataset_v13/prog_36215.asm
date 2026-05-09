; DESCRIPTION: Draws a cyan rectangle at (441, 32) with width 19 and height 104.
; PLAN: r0=441(x), r1=32(y), r2=19(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 32
LDI r2, 19
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
