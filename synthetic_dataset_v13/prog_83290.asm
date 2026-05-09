; DESCRIPTION: Creates a blue rectangular region at (246, 50) spanning 71 by 105 pixels.
; PLAN: r0=246(x), r1=50(y), r2=71(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 50
LDI r2, 71
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
