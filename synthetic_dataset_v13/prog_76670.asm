; DESCRIPTION: Draws a orange rectangle at (396, 193) with width 112 and height 42.
; PLAN: r0=396(x), r1=193(y), r2=112(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 193
LDI r2, 112
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
