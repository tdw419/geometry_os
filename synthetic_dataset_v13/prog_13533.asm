; DESCRIPTION: Creates a cyan rectangular region at (307, 44) spanning 53 by 115 pixels.
; PLAN: r0=307(x), r1=44(y), r2=53(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 44
LDI r2, 53
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
