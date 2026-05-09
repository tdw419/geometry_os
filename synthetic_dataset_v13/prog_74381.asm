; DESCRIPTION: Draws a orange rectangle at (130, 159) with width 91 and height 64.
; PLAN: r0=130(x), r1=159(y), r2=91(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 159
LDI r2, 91
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
