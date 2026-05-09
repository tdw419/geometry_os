; DESCRIPTION: Draws a orange rectangle at (146, 117) with width 117 and height 21.
; PLAN: r0=146(x), r1=117(y), r2=117(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 117
LDI r2, 117
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
