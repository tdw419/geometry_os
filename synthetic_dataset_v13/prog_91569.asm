; DESCRIPTION: Creates a purple rectangular region at (45, 80) spanning 32 by 65 pixels.
; PLAN: r0=45(x), r1=80(y), r2=32(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 80
LDI r2, 32
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
