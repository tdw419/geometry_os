; DESCRIPTION: Creates a cyan rectangular region at (289, 126) spanning 57 by 72 pixels.
; PLAN: r0=289(x), r1=126(y), r2=57(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 126
LDI r2, 57
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
