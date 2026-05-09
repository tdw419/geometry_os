; DESCRIPTION: Draws a cyan rectangle at (334, 135) with width 28 and height 111.
; PLAN: r0=334(x), r1=135(y), r2=28(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 135
LDI r2, 28
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
