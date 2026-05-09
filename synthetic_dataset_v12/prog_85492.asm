; DESCRIPTION: Draws a orange rectangle at (143, 45) with width 93 and height 42.
; PLAN: r0=143(x), r1=45(y), r2=93(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 45
LDI r2, 93
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
