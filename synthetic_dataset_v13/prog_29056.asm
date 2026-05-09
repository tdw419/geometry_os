; DESCRIPTION: Creates a cyan rectangular region at (409, 50) spanning 72 by 80 pixels.
; PLAN: r0=409(x), r1=50(y), r2=72(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 50
LDI r2, 72
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
