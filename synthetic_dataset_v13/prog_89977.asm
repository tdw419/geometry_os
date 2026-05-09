; DESCRIPTION: Creates a yellow rectangular region at (120, 163) spanning 39 by 60 pixels.
; PLAN: r0=120(x), r1=163(y), r2=39(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 163
LDI r2, 39
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
