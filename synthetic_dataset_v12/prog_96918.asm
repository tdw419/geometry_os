; DESCRIPTION: Creates a yellow rectangular region at (98, 187) spanning 41 by 50 pixels.
; PLAN: r0=98(x), r1=187(y), r2=41(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 187
LDI r2, 41
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
