; DESCRIPTION: Creates a cyan rectangular region at (231, 121) spanning 109 by 66 pixels.
; PLAN: r0=231(x), r1=121(y), r2=109(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 121
LDI r2, 109
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
