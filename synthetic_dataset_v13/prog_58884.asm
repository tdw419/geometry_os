; DESCRIPTION: Creates a white rectangular region at (45, 66) spanning 95 by 73 pixels.
; PLAN: r0=45(x), r1=66(y), r2=95(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 66
LDI r2, 95
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
