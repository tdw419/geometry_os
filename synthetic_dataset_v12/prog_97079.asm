; DESCRIPTION: Draws a cyan rectangle at (408, 163) with width 25 and height 68.
; PLAN: r0=408(x), r1=163(y), r2=25(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 163
LDI r2, 25
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
