; DESCRIPTION: Draws a red rectangle at (333, 179) with width 70 and height 12.
; PLAN: r0=333(x), r1=179(y), r2=70(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 179
LDI r2, 70
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
