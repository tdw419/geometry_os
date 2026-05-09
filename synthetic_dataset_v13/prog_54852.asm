; DESCRIPTION: Creates a cyan rectangular region at (161, 7) spanning 49 by 63 pixels.
; PLAN: r0=161(x), r1=7(y), r2=49(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 7
LDI r2, 49
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
