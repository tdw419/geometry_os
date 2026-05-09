; DESCRIPTION: Creates a green rectangular region at (211, 80) spanning 93 by 87 pixels.
; PLAN: r0=211(x), r1=80(y), r2=93(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 80
LDI r2, 93
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
