; DESCRIPTION: Draws a cyan rectangle at (96, 70) with width 28 and height 40.
; PLAN: r0=96(x), r1=70(y), r2=28(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 70
LDI r2, 28
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
