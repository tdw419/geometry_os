; DESCRIPTION: Creates a yellow rectangular region at (423, 30) spanning 87 by 111 pixels.
; PLAN: r0=423(x), r1=30(y), r2=87(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 30
LDI r2, 87
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
