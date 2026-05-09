; DESCRIPTION: Creates a cyan rectangular region at (41, 200) spanning 36 by 21 pixels.
; PLAN: r0=41(x), r1=200(y), r2=36(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 200
LDI r2, 36
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
