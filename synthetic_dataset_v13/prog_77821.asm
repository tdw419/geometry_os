; DESCRIPTION: Creates a yellow rectangular region at (257, 41) spanning 77 by 60 pixels.
; PLAN: r0=257(x), r1=41(y), r2=77(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 41
LDI r2, 77
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
