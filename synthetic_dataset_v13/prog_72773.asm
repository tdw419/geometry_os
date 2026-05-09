; DESCRIPTION: Creates a red rectangular region at (296, 155) spanning 80 by 11 pixels.
; PLAN: r0=296(x), r1=155(y), r2=80(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 155
LDI r2, 80
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
