; DESCRIPTION: Creates a orange rectangular region at (36, 103) spanning 93 by 110 pixels.
; PLAN: r0=36(x), r1=103(y), r2=93(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 103
LDI r2, 93
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
