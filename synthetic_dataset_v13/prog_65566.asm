; DESCRIPTION: Draws a yellow rectangle at (186, 120) with width 40 and height 52.
; PLAN: r0=186(x), r1=120(y), r2=40(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 120
LDI r2, 40
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
