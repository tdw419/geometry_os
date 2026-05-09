; DESCRIPTION: Draws a blue rectangle at (284, 130) with width 120 and height 103.
; PLAN: r0=284(x), r1=130(y), r2=120(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 130
LDI r2, 120
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
