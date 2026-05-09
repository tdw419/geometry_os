; DESCRIPTION: Creates a red rectangular region at (438, 163) spanning 16 by 93 pixels.
; PLAN: r0=438(x), r1=163(y), r2=16(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 163
LDI r2, 16
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
