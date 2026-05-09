; DESCRIPTION: Creates a green rectangular region at (283, 109) spanning 27 by 98 pixels.
; PLAN: r0=283(x), r1=109(y), r2=27(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 109
LDI r2, 27
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
