; DESCRIPTION: Draws a yellow rectangle at (288, 115) with width 47 and height 42.
; PLAN: r0=288(x), r1=115(y), r2=47(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 115
LDI r2, 47
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
