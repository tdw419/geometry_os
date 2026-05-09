; DESCRIPTION: Creates a yellow rectangular region at (249, 48) spanning 71 by 41 pixels.
; PLAN: r0=249(x), r1=48(y), r2=71(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 48
LDI r2, 71
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
