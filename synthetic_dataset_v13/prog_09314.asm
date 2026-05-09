; DESCRIPTION: Creates a red rectangular region at (65, 137) spanning 28 by 86 pixels.
; PLAN: r0=65(x), r1=137(y), r2=28(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 137
LDI r2, 28
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
