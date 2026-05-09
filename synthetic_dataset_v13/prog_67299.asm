; DESCRIPTION: Creates a blue rectangular region at (299, 190) spanning 55 by 65 pixels.
; PLAN: r0=299(x), r1=190(y), r2=55(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 190
LDI r2, 55
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
