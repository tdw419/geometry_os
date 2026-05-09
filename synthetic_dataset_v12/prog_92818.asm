; DESCRIPTION: Creates a green rectangular region at (130, 150) spanning 59 by 38 pixels.
; PLAN: r0=130(x), r1=150(y), r2=59(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 150
LDI r2, 59
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
