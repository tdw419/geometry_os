; DESCRIPTION: Creates a cyan rectangular region at (313, 137) spanning 76 by 80 pixels.
; PLAN: r0=313(x), r1=137(y), r2=76(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 137
LDI r2, 76
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
