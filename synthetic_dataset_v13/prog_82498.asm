; DESCRIPTION: Creates a blue rectangular region at (321, 165) spanning 95 by 10 pixels.
; PLAN: r0=321(x), r1=165(y), r2=95(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 165
LDI r2, 95
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
