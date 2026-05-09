; DESCRIPTION: Draws a red rectangle at (349, 161) with width 32 and height 79.
; PLAN: r0=349(x), r1=161(y), r2=32(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 161
LDI r2, 32
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
