; DESCRIPTION: Draws a white rectangle at (280, 131) with width 108 and height 104.
; PLAN: r0=280(x), r1=131(y), r2=108(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 131
LDI r2, 108
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
