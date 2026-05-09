; DESCRIPTION: Creates a purple rectangular region at (80, 152) spanning 42 by 62 pixels.
; PLAN: r0=80(x), r1=152(y), r2=42(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 152
LDI r2, 42
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
