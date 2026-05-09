; DESCRIPTION: Draws a cyan rectangle at (71, 45) with width 111 and height 117.
; PLAN: r0=71(x), r1=45(y), r2=111(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 45
LDI r2, 111
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
