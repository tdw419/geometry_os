; DESCRIPTION: Creates a purple rectangular region at (275, 193) spanning 50 by 49 pixels.
; PLAN: r0=275(x), r1=193(y), r2=50(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 193
LDI r2, 50
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
