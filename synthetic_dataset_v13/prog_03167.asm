; DESCRIPTION: Creates a yellow rectangular region at (32, 93) spanning 92 by 41 pixels.
; PLAN: r0=32(x), r1=93(y), r2=92(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 93
LDI r2, 92
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
