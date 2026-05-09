; DESCRIPTION: Draws a orange rectangle at (146, 167) with width 87 and height 60.
; PLAN: r0=146(x), r1=167(y), r2=87(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 167
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
