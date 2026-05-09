; DESCRIPTION: Creates a green rectangular region at (405, 138) spanning 87 by 14 pixels.
; PLAN: r0=405(x), r1=138(y), r2=87(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 138
LDI r2, 87
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
