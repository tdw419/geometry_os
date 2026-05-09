; DESCRIPTION: Draws a black rectangle at (152, 52) with width 109 and height 120.
; PLAN: r0=152(x), r1=52(y), r2=109(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 52
LDI r2, 109
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
