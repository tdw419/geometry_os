; DESCRIPTION: Creates a yellow rectangular region at (264, 6) spanning 106 by 50 pixels.
; PLAN: r0=264(x), r1=6(y), r2=106(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 6
LDI r2, 106
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
