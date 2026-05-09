; DESCRIPTION: Creates a yellow rectangular region at (147, 111) spanning 55 by 50 pixels.
; PLAN: r0=147(x), r1=111(y), r2=55(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 111
LDI r2, 55
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
