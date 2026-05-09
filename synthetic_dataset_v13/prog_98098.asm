; DESCRIPTION: Creates a cyan rectangular region at (224, 4) spanning 75 by 56 pixels.
; PLAN: r0=224(x), r1=4(y), r2=75(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 4
LDI r2, 75
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
