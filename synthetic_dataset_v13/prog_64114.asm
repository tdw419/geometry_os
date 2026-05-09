; DESCRIPTION: Creates a blue rectangular region at (384, 116) spanning 47 by 117 pixels.
; PLAN: r0=384(x), r1=116(y), r2=47(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 116
LDI r2, 47
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
