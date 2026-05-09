; DESCRIPTION: Creates a blue rectangular region at (386, 205) spanning 107 by 41 pixels.
; PLAN: r0=386(x), r1=205(y), r2=107(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 205
LDI r2, 107
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
