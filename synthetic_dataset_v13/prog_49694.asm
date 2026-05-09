; DESCRIPTION: Creates a cyan rectangular region at (181, 47) spanning 23 by 61 pixels.
; PLAN: r0=181(x), r1=47(y), r2=23(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 47
LDI r2, 23
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
