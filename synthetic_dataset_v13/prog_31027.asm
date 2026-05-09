; DESCRIPTION: Draws a red rectangle at (404, 47) with width 21 and height 84.
; PLAN: r0=404(x), r1=47(y), r2=21(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 47
LDI r2, 21
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
