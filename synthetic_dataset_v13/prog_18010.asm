; DESCRIPTION: Creates a white rectangular region at (148, 205) spanning 26 by 45 pixels.
; PLAN: r0=148(x), r1=205(y), r2=26(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 205
LDI r2, 26
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
