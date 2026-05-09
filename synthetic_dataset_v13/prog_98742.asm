; DESCRIPTION: Creates a cyan rectangular region at (195, 231) spanning 116 by 22 pixels.
; PLAN: r0=195(x), r1=231(y), r2=116(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 231
LDI r2, 116
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
