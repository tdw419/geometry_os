; DESCRIPTION: Creates a red rectangular region at (273, 41) spanning 94 by 65 pixels.
; PLAN: r0=273(x), r1=41(y), r2=94(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 41
LDI r2, 94
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
