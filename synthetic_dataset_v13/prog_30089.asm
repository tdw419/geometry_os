; DESCRIPTION: Creates a black rectangular region at (66, 48) spanning 41 by 93 pixels.
; PLAN: r0=66(x), r1=48(y), r2=41(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 48
LDI r2, 41
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
