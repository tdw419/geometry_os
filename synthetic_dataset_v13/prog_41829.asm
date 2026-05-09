; DESCRIPTION: Creates a orange rectangular region at (378, 135) spanning 45 by 93 pixels.
; PLAN: r0=378(x), r1=135(y), r2=45(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 135
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
