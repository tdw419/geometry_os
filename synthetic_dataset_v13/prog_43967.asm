; DESCRIPTION: Creates a cyan rectangular region at (200, 161) spanning 60 by 45 pixels.
; PLAN: r0=200(x), r1=161(y), r2=60(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 161
LDI r2, 60
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
