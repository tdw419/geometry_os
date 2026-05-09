; DESCRIPTION: Draws a red rectangle at (400, 13) with width 55 and height 11.
; PLAN: r0=400(x), r1=13(y), r2=55(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 13
LDI r2, 55
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
