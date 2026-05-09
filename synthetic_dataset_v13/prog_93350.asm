; DESCRIPTION: Draws a red rectangle at (392, 149) with width 95 and height 43.
; PLAN: r0=392(x), r1=149(y), r2=95(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 149
LDI r2, 95
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
