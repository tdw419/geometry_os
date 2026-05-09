; DESCRIPTION: Creates a cyan rectangular region at (201, 145) spanning 117 by 83 pixels.
; PLAN: r0=201(x), r1=145(y), r2=117(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 145
LDI r2, 117
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
