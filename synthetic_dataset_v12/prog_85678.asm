; DESCRIPTION: Creates a white rectangular region at (149, 195) spanning 85 by 33 pixels.
; PLAN: r0=149(x), r1=195(y), r2=85(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 195
LDI r2, 85
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
