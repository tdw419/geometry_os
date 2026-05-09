; DESCRIPTION: Draws a cyan rectangle at (289, 111) with width 27 and height 60.
; PLAN: r0=289(x), r1=111(y), r2=27(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 111
LDI r2, 27
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
