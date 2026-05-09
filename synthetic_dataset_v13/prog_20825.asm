; DESCRIPTION: Creates a green rectangular region at (180, 71) spanning 90 by 110 pixels.
; PLAN: r0=180(x), r1=71(y), r2=90(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 71
LDI r2, 90
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
