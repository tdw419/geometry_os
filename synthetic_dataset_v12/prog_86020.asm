; DESCRIPTION: Draws a red rectangle at (346, 63) with width 58 and height 34.
; PLAN: r0=346(x), r1=63(y), r2=58(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 63
LDI r2, 58
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
