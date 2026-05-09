; DESCRIPTION: Creates a cyan rectangular region at (155, 191) spanning 54 by 30 pixels.
; PLAN: r0=155(x), r1=191(y), r2=54(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 191
LDI r2, 54
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
