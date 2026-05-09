; DESCRIPTION: Draws a orange rectangle at (307, 56) with width 32 and height 91.
; PLAN: r0=307(x), r1=56(y), r2=32(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 56
LDI r2, 32
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
