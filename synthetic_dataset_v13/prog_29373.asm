; DESCRIPTION: Creates a green rectangular region at (11, 134) spanning 82 by 100 pixels.
; PLAN: r0=11(x), r1=134(y), r2=82(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 134
LDI r2, 82
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
