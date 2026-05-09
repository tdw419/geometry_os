; DESCRIPTION: Draws a red rectangle at (154, 164) with width 113 and height 63.
; PLAN: r0=154(x), r1=164(y), r2=113(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 164
LDI r2, 113
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
