; DESCRIPTION: Creates a cyan rectangular region at (231, 141) spanning 81 by 73 pixels.
; PLAN: r0=231(x), r1=141(y), r2=81(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 141
LDI r2, 81
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
