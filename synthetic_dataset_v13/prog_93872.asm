; DESCRIPTION: Creates a red rectangular region at (273, 48) spanning 14 by 44 pixels.
; PLAN: r0=273(x), r1=48(y), r2=14(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 48
LDI r2, 14
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
