; DESCRIPTION: Creates a purple rectangular region at (73, 154) spanning 50 by 72 pixels.
; PLAN: r0=73(x), r1=154(y), r2=50(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 154
LDI r2, 50
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
