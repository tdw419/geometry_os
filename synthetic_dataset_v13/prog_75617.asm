; DESCRIPTION: Draws a orange rectangle at (262, 36) with width 47 and height 65.
; PLAN: r0=262(x), r1=36(y), r2=47(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 36
LDI r2, 47
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
