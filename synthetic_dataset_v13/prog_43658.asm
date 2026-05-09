; DESCRIPTION: Creates a black rectangular region at (66, 71) spanning 103 by 70 pixels.
; PLAN: r0=66(x), r1=71(y), r2=103(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 71
LDI r2, 103
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
