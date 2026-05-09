; DESCRIPTION: Creates a cyan rectangular region at (14, 94) spanning 77 by 117 pixels.
; PLAN: r0=14(x), r1=94(y), r2=77(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 94
LDI r2, 77
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
