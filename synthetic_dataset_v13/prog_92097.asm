; DESCRIPTION: Draws a red rectangle at (333, 126) with width 98 and height 81.
; PLAN: r0=333(x), r1=126(y), r2=98(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 126
LDI r2, 98
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
