; DESCRIPTION: Creates a red rectangular region at (45, 18) spanning 115 by 75 pixels.
; PLAN: r0=45(x), r1=18(y), r2=115(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 18
LDI r2, 115
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
