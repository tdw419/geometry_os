; DESCRIPTION: Creates a red rectangular region at (296, 45) spanning 23 by 29 pixels.
; PLAN: r0=296(x), r1=45(y), r2=23(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 45
LDI r2, 23
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
