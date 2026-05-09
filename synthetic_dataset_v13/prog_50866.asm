; DESCRIPTION: Creates a cyan rectangular region at (80, 46) spanning 14 by 64 pixels.
; PLAN: r0=80(x), r1=46(y), r2=14(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 14
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
