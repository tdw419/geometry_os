; DESCRIPTION: Creates a cyan rectangular region at (77, 71) spanning 96 by 72 pixels.
; PLAN: r0=77(x), r1=71(y), r2=96(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 71
LDI r2, 96
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
