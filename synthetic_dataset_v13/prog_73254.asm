; DESCRIPTION: Draws a red rectangle at (277, 138) with width 16 and height 73.
; PLAN: r0=277(x), r1=138(y), r2=16(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 138
LDI r2, 16
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
