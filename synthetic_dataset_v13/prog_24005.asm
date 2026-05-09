; DESCRIPTION: Creates a green rectangular region at (205, 159) spanning 86 by 79 pixels.
; PLAN: r0=205(x), r1=159(y), r2=86(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 159
LDI r2, 86
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
