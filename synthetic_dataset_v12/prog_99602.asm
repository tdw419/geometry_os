; DESCRIPTION: Creates a cyan rectangular region at (164, 30) spanning 93 by 60 pixels.
; PLAN: r0=164(x), r1=30(y), r2=93(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 30
LDI r2, 93
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
