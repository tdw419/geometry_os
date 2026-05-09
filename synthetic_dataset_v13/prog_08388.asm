; DESCRIPTION: Creates a black rectangular region at (271, 182) spanning 71 by 41 pixels.
; PLAN: r0=271(x), r1=182(y), r2=71(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 182
LDI r2, 71
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
