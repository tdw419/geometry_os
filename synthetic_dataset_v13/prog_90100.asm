; DESCRIPTION: Draws a blue rectangle at (277, 27) with width 45 and height 10.
; PLAN: r0=277(x), r1=27(y), r2=45(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 27
LDI r2, 45
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
