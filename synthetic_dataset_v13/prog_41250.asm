; DESCRIPTION: Creates a cyan rectangular region at (221, 76) spanning 53 by 109 pixels.
; PLAN: r0=221(x), r1=76(y), r2=53(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 76
LDI r2, 53
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
