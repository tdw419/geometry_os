; DESCRIPTION: Creates a red rectangular region at (435, 10) spanning 44 by 66 pixels.
; PLAN: r0=435(x), r1=10(y), r2=44(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 10
LDI r2, 44
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
