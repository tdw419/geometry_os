; DESCRIPTION: Draws a orange rectangle at (284, 70) with width 41 and height 56.
; PLAN: r0=284(x), r1=70(y), r2=41(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 70
LDI r2, 41
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
