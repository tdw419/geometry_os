; DESCRIPTION: Draws a red rectangle at (403, 33) with width 89 and height 51.
; PLAN: r0=403(x), r1=33(y), r2=89(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 33
LDI r2, 89
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
