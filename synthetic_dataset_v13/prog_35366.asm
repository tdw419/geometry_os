; DESCRIPTION: Creates a green rectangular region at (428, 143) spanning 49 by 93 pixels.
; PLAN: r0=428(x), r1=143(y), r2=49(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 143
LDI r2, 49
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
