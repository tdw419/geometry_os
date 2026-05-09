; DESCRIPTION: Draws a red rectangle at (464, 16) with width 21 and height 113.
; PLAN: r0=464(x), r1=16(y), r2=21(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 16
LDI r2, 21
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
