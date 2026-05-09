; DESCRIPTION: Creates a orange rectangular region at (322, 138) spanning 85 by 106 pixels.
; PLAN: r0=322(x), r1=138(y), r2=85(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 138
LDI r2, 85
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
