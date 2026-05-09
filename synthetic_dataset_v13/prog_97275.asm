; DESCRIPTION: Draws a red rectangle at (277, 8) with width 59 and height 33.
; PLAN: r0=277(x), r1=8(y), r2=59(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 8
LDI r2, 59
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
