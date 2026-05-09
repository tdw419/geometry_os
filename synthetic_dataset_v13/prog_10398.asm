; DESCRIPTION: Creates a white rectangular region at (45, 98) spanning 27 by 11 pixels.
; PLAN: r0=45(x), r1=98(y), r2=27(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 98
LDI r2, 27
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
