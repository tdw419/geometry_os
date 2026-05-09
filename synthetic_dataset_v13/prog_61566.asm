; DESCRIPTION: Creates a yellow rectangular region at (161, 152) spanning 111 by 52 pixels.
; PLAN: r0=161(x), r1=152(y), r2=111(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 152
LDI r2, 111
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
