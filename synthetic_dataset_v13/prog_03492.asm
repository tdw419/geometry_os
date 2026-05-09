; DESCRIPTION: Creates a yellow rectangular region at (358, 197) spanning 101 by 41 pixels.
; PLAN: r0=358(x), r1=197(y), r2=101(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 197
LDI r2, 101
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
