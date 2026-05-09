; DESCRIPTION: Draws a orange rectangle at (255, 13) with width 60 and height 79.
; PLAN: r0=255(x), r1=13(y), r2=60(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 13
LDI r2, 60
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
