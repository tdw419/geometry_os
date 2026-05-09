; DESCRIPTION: Creates a cyan rectangular region at (224, 102) spanning 92 by 32 pixels.
; PLAN: r0=224(x), r1=102(y), r2=92(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 102
LDI r2, 92
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
