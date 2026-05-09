; DESCRIPTION: Draws a blue rectangle at (284, 141) with width 117 and height 113.
; PLAN: r0=284(x), r1=141(y), r2=117(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 141
LDI r2, 117
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
