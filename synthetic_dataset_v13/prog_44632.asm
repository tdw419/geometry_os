; DESCRIPTION: Creates a cyan rectangular region at (456, 131) spanning 14 by 115 pixels.
; PLAN: r0=456(x), r1=131(y), r2=14(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 131
LDI r2, 14
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
