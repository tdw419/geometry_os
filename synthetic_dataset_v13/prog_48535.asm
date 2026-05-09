; DESCRIPTION: Draws a cyan rectangle at (140, 12) with width 28 and height 103.
; PLAN: r0=140(x), r1=12(y), r2=28(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 12
LDI r2, 28
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
