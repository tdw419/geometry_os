; DESCRIPTION: Draws a red rectangle at (48, 161) with width 18 and height 14.
; PLAN: r0=48(x), r1=161(y), r2=18(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 161
LDI r2, 18
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
