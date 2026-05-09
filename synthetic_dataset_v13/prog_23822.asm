; DESCRIPTION: Creates a cyan rectangular region at (308, 45) spanning 37 by 66 pixels.
; PLAN: r0=308(x), r1=45(y), r2=37(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 45
LDI r2, 37
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
