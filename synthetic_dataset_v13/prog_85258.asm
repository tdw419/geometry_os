; DESCRIPTION: Draws a yellow rectangle at (394, 1) with width 117 and height 120.
; PLAN: r0=394(x), r1=1(y), r2=117(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 1
LDI r2, 117
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
