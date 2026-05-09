; DESCRIPTION: Creates a cyan rectangular region at (433, 3) spanning 38 by 55 pixels.
; PLAN: r0=433(x), r1=3(y), r2=38(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 3
LDI r2, 38
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
