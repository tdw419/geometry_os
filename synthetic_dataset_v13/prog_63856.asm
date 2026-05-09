; DESCRIPTION: Creates a blue rectangular region at (286, 39) spanning 24 by 38 pixels.
; PLAN: r0=286(x), r1=39(y), r2=24(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 39
LDI r2, 24
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
