; DESCRIPTION: Draws a red rectangle at (197, 108) with width 70 and height 100.
; PLAN: r0=197(x), r1=108(y), r2=70(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 108
LDI r2, 70
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
