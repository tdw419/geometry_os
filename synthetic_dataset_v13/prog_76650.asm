; DESCRIPTION: Creates a yellow rectangular region at (445, 41) spanning 25 by 21 pixels.
; PLAN: r0=445(x), r1=41(y), r2=25(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 41
LDI r2, 25
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
