; DESCRIPTION: Draws a orange rectangle at (243, 2) with width 93 and height 80.
; PLAN: r0=243(x), r1=2(y), r2=93(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 2
LDI r2, 93
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
