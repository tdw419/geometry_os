; DESCRIPTION: Creates a red rectangular region at (214, 201) spanning 73 by 28 pixels.
; PLAN: r0=214(x), r1=201(y), r2=73(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 201
LDI r2, 73
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
