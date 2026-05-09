; DESCRIPTION: Draws a yellow rectangle at (198, 187) with width 54 and height 60.
; PLAN: r0=198(x), r1=187(y), r2=54(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 187
LDI r2, 54
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
