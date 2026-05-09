; DESCRIPTION: Creates a cyan rectangular region at (379, 124) spanning 55 by 79 pixels.
; PLAN: r0=379(x), r1=124(y), r2=55(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 124
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
