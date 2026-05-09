; DESCRIPTION: Creates a green rectangular region at (160, 150) spanning 77 by 71 pixels.
; PLAN: r0=160(x), r1=150(y), r2=77(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 150
LDI r2, 77
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
