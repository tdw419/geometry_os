; DESCRIPTION: Creates a white rectangular region at (45, 33) spanning 63 by 24 pixels.
; PLAN: r0=45(x), r1=33(y), r2=63(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 33
LDI r2, 63
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
