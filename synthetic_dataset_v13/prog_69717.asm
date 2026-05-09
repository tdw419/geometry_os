; DESCRIPTION: Creates a orange rectangular region at (197, 81) spanning 35 by 58 pixels.
; PLAN: r0=197(x), r1=81(y), r2=35(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 81
LDI r2, 35
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
