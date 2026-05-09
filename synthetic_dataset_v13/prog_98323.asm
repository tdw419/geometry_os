; DESCRIPTION: Creates a red rectangular region at (7, 48) spanning 96 by 11 pixels.
; PLAN: r0=7(x), r1=48(y), r2=96(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 48
LDI r2, 96
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
