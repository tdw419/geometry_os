; DESCRIPTION: Creates a green rectangular region at (401, 109) spanning 31 by 72 pixels.
; PLAN: r0=401(x), r1=109(y), r2=31(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 109
LDI r2, 31
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
