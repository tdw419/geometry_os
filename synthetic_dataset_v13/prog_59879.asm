; DESCRIPTION: Draws a orange rectangle at (342, 146) with width 105 and height 27.
; PLAN: r0=342(x), r1=146(y), r2=105(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 146
LDI r2, 105
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
