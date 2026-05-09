; DESCRIPTION: Draws a cyan rectangle at (313, 88) with width 10 and height 100.
; PLAN: r0=313(x), r1=88(y), r2=10(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 88
LDI r2, 10
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
