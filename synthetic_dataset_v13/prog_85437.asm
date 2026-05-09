; DESCRIPTION: Draws a cyan rectangle at (91, 59) with width 10 and height 114.
; PLAN: r0=91(x), r1=59(y), r2=10(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 59
LDI r2, 10
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
