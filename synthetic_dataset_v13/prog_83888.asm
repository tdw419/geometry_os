; DESCRIPTION: Creates a red rectangular region at (296, 142) spanning 54 by 99 pixels.
; PLAN: r0=296(x), r1=142(y), r2=54(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 142
LDI r2, 54
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
