; DESCRIPTION: Draws a white rectangle at (123, 168) with width 38 and height 33.
; PLAN: r0=123(x), r1=168(y), r2=38(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 168
LDI r2, 38
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
