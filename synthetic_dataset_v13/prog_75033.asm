; DESCRIPTION: Creates a green rectangular region at (213, 164) spanning 11 by 41 pixels.
; PLAN: r0=213(x), r1=164(y), r2=11(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 164
LDI r2, 11
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
