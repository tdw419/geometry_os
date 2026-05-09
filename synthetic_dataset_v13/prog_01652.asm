; DESCRIPTION: Creates a red rectangular region at (430, 68) spanning 48 by 72 pixels.
; PLAN: r0=430(x), r1=68(y), r2=48(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 68
LDI r2, 48
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
