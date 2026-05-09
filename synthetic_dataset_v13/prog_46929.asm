; DESCRIPTION: Creates a green rectangular region at (309, 217) spanning 120 by 30 pixels.
; PLAN: r0=309(x), r1=217(y), r2=120(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 217
LDI r2, 120
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
