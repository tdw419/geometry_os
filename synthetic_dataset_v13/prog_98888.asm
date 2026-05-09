; DESCRIPTION: Creates a black rectangular region at (280, 60) spanning 98 by 73 pixels.
; PLAN: r0=280(x), r1=60(y), r2=98(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 60
LDI r2, 98
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
