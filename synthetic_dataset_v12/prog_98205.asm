; DESCRIPTION: Creates a red rectangular region at (193, 109) spanning 94 by 119 pixels.
; PLAN: r0=193(x), r1=109(y), r2=94(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 109
LDI r2, 94
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
