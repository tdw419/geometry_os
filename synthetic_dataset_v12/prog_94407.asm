; DESCRIPTION: Draws a blue rectangle at (387, 124) with width 69 and height 120.
; PLAN: r0=387(x), r1=124(y), r2=69(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 124
LDI r2, 69
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
