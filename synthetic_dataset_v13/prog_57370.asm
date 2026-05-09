; DESCRIPTION: Creates a green rectangular region at (191, 38) spanning 117 by 111 pixels.
; PLAN: r0=191(x), r1=38(y), r2=117(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 38
LDI r2, 117
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
