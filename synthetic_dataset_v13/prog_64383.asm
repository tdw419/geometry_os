; DESCRIPTION: Draws a orange rectangle at (146, 74) with width 119 and height 86.
; PLAN: r0=146(x), r1=74(y), r2=119(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 74
LDI r2, 119
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
