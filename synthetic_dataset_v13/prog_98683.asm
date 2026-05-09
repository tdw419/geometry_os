; DESCRIPTION: Creates a orange rectangular region at (469, 80) spanning 27 by 45 pixels.
; PLAN: r0=469(x), r1=80(y), r2=27(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 80
LDI r2, 27
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
