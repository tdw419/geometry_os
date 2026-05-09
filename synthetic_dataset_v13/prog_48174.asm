; DESCRIPTION: Draws a cyan rectangle at (325, 111) with width 104 and height 13.
; PLAN: r0=325(x), r1=111(y), r2=104(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 111
LDI r2, 104
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
