; DESCRIPTION: Draws a red rectangle at (197, 23) with width 49 and height 45.
; PLAN: r0=197(x), r1=23(y), r2=49(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 23
LDI r2, 49
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
