; DESCRIPTION: Creates a purple rectangular region at (38, 193) spanning 39 by 32 pixels.
; PLAN: r0=38(x), r1=193(y), r2=39(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 193
LDI r2, 39
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
