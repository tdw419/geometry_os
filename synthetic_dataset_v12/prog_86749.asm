; DESCRIPTION: Creates a purple rectangular region at (223, 168) spanning 48 by 13 pixels.
; PLAN: r0=223(x), r1=168(y), r2=48(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 168
LDI r2, 48
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
