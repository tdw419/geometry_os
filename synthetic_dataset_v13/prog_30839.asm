; DESCRIPTION: Draws a cyan rectangle at (391, 44) with width 47 and height 114.
; PLAN: r0=391(x), r1=44(y), r2=47(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 44
LDI r2, 47
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
