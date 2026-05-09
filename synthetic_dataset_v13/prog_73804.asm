; DESCRIPTION: Creates a green rectangular region at (276, 79) spanning 55 by 86 pixels.
; PLAN: r0=276(x), r1=79(y), r2=55(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 79
LDI r2, 55
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
