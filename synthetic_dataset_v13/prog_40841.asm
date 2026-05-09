; DESCRIPTION: Creates a green rectangular region at (445, 74) spanning 15 by 41 pixels.
; PLAN: r0=445(x), r1=74(y), r2=15(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 74
LDI r2, 15
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
