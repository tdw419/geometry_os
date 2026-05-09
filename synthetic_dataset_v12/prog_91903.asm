; DESCRIPTION: Creates a cyan rectangular region at (136, 24) spanning 76 by 79 pixels.
; PLAN: r0=136(x), r1=24(y), r2=76(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 24
LDI r2, 76
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
