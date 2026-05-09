; DESCRIPTION: Creates a green rectangular region at (303, 77) spanning 67 by 27 pixels.
; PLAN: r0=303(x), r1=77(y), r2=67(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 77
LDI r2, 67
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
