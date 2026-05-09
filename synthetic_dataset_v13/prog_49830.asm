; DESCRIPTION: Creates a cyan rectangular region at (331, 124) spanning 119 by 120 pixels.
; PLAN: r0=331(x), r1=124(y), r2=119(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 124
LDI r2, 119
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
