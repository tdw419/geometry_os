; DESCRIPTION: Creates a cyan rectangular region at (233, 90) spanning 71 by 49 pixels.
; PLAN: r0=233(x), r1=90(y), r2=71(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 90
LDI r2, 71
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
