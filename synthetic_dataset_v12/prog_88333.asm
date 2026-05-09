; DESCRIPTION: Creates a purple rectangular region at (214, 98) spanning 109 by 61 pixels.
; PLAN: r0=214(x), r1=98(y), r2=109(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 98
LDI r2, 109
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
