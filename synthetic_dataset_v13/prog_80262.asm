; DESCRIPTION: Creates a green rectangular region at (373, 41) spanning 68 by 93 pixels.
; PLAN: r0=373(x), r1=41(y), r2=68(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 41
LDI r2, 68
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
