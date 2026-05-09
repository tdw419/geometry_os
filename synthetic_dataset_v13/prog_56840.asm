; DESCRIPTION: Creates a green rectangular region at (410, 2) spanning 78 by 28 pixels.
; PLAN: r0=410(x), r1=2(y), r2=78(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 2
LDI r2, 78
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
