; DESCRIPTION: Draws a orange rectangle at (146, 83) with width 40 and height 48.
; PLAN: r0=146(x), r1=83(y), r2=40(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 83
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
