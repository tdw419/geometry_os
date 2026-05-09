; DESCRIPTION: Creates a cyan rectangular region at (48, 127) spanning 83 by 76 pixels.
; PLAN: r0=48(x), r1=127(y), r2=83(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 127
LDI r2, 83
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
