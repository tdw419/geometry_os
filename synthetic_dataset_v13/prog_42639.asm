; DESCRIPTION: Creates a black rectangular region at (290, 14) spanning 115 by 45 pixels.
; PLAN: r0=290(x), r1=14(y), r2=115(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 14
LDI r2, 115
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
