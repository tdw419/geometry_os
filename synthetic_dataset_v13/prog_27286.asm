; DESCRIPTION: Creates a green rectangular region at (157, 93) spanning 53 by 34 pixels.
; PLAN: r0=157(x), r1=93(y), r2=53(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 93
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
