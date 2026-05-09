; DESCRIPTION: Creates a cyan rectangular region at (73, 12) spanning 83 by 80 pixels.
; PLAN: r0=73(x), r1=12(y), r2=83(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 12
LDI r2, 83
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
