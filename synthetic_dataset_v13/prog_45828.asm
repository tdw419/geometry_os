; DESCRIPTION: Creates a cyan rectangular region at (358, 61) spanning 46 by 91 pixels.
; PLAN: r0=358(x), r1=61(y), r2=46(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 61
LDI r2, 46
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
