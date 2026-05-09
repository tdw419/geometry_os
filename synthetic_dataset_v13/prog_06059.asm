; DESCRIPTION: Draws a blue rectangle at (392, 173) with width 24 and height 70.
; PLAN: r0=392(x), r1=173(y), r2=24(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 173
LDI r2, 24
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
