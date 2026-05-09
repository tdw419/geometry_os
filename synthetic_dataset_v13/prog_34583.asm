; DESCRIPTION: Creates a yellow rectangular region at (210, 120) spanning 51 by 41 pixels.
; PLAN: r0=210(x), r1=120(y), r2=51(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 120
LDI r2, 51
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
