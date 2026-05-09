; DESCRIPTION: Creates a green rectangular region at (45, 123) spanning 50 by 111 pixels.
; PLAN: r0=45(x), r1=123(y), r2=50(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 123
LDI r2, 50
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
