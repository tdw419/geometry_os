; DESCRIPTION: Creates a cyan rectangular region at (94, 60) spanning 44 by 44 pixels.
; PLAN: r0=94(x), r1=60(y), r2=44(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 60
LDI r2, 44
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
