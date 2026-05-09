; DESCRIPTION: Creates a cyan rectangular region at (164, 95) spanning 76 by 86 pixels.
; PLAN: r0=164(x), r1=95(y), r2=76(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 95
LDI r2, 76
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
