; DESCRIPTION: Draws a red rectangle at (344, 215) with width 102 and height 33.
; PLAN: r0=344(x), r1=215(y), r2=102(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 215
LDI r2, 102
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
