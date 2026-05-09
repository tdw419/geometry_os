; DESCRIPTION: Creates a cyan rectangular region at (255, 200) spanning 47 by 55 pixels.
; PLAN: r0=255(x), r1=200(y), r2=47(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 200
LDI r2, 47
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
