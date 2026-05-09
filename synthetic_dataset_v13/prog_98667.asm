; DESCRIPTION: Creates a cyan rectangular region at (89, 83) spanning 61 by 117 pixels.
; PLAN: r0=89(x), r1=83(y), r2=61(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 83
LDI r2, 61
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
