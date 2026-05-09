; DESCRIPTION: Draws a magenta rectangle at (284, 164) with width 51 and height 46.
; PLAN: r0=284(x), r1=164(y), r2=51(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 164
LDI r2, 51
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
