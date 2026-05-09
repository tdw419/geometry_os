; DESCRIPTION: Creates a cyan rectangular region at (259, 80) spanning 24 by 116 pixels.
; PLAN: r0=259(x), r1=80(y), r2=24(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 80
LDI r2, 24
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
