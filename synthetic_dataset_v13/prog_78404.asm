; DESCRIPTION: Draws a orange rectangle at (32, 111) with width 60 and height 50.
; PLAN: r0=32(x), r1=111(y), r2=60(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 111
LDI r2, 60
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
