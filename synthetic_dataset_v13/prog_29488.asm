; DESCRIPTION: Draws a yellow rectangle at (262, 44) with width 13 and height 120.
; PLAN: r0=262(x), r1=44(y), r2=13(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 44
LDI r2, 13
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
