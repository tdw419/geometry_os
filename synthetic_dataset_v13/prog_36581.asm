; DESCRIPTION: Creates a cyan rectangular region at (224, 106) spanning 20 by 114 pixels.
; PLAN: r0=224(x), r1=106(y), r2=20(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 106
LDI r2, 20
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
