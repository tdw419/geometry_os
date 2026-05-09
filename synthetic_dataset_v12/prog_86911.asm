; DESCRIPTION: Creates a purple rectangular region at (400, 154) spanning 23 by 60 pixels.
; PLAN: r0=400(x), r1=154(y), r2=23(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 154
LDI r2, 23
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
