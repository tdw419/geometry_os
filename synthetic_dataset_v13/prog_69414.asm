; DESCRIPTION: Draws a orange rectangle at (371, 98) with width 48 and height 27.
; PLAN: r0=371(x), r1=98(y), r2=48(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 98
LDI r2, 48
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
