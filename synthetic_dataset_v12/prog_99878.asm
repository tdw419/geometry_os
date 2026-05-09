; DESCRIPTION: Creates a green rectangular region at (410, 46) spanning 62 by 111 pixels.
; PLAN: r0=410(x), r1=46(y), r2=62(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 46
LDI r2, 62
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
