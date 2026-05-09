; DESCRIPTION: Creates a cyan rectangular region at (71, 82) spanning 99 by 84 pixels.
; PLAN: r0=71(x), r1=82(y), r2=99(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 82
LDI r2, 99
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
