; DESCRIPTION: Creates a green rectangular region at (380, 208) spanning 38 by 22 pixels.
; PLAN: r0=380(x), r1=208(y), r2=38(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 208
LDI r2, 38
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
