; DESCRIPTION: Draws a blue rectangle at (262, 33) with width 77 and height 60.
; PLAN: r0=262(x), r1=33(y), r2=77(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 33
LDI r2, 77
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
