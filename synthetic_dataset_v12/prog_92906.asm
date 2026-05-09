; DESCRIPTION: Creates a cyan rectangular region at (292, 49) spanning 53 by 120 pixels.
; PLAN: r0=292(x), r1=49(y), r2=53(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 49
LDI r2, 53
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
