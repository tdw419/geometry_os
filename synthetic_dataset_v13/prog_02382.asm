; DESCRIPTION: Draws a yellow rectangle at (387, 173) with width 74 and height 54.
; PLAN: r0=387(x), r1=173(y), r2=74(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 173
LDI r2, 74
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
