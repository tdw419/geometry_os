; DESCRIPTION: Draws a orange rectangle at (279, 165) with width 42 and height 46.
; PLAN: r0=279(x), r1=165(y), r2=42(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 165
LDI r2, 42
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
