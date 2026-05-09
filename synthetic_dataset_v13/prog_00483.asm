; DESCRIPTION: Creates a cyan rectangular region at (218, 112) spanning 65 by 90 pixels.
; PLAN: r0=218(x), r1=112(y), r2=65(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 112
LDI r2, 65
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
