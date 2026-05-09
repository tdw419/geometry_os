; DESCRIPTION: Creates a yellow rectangular region at (198, 60) spanning 71 by 85 pixels.
; PLAN: r0=198(x), r1=60(y), r2=71(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 60
LDI r2, 71
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
