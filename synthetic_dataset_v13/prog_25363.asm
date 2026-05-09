; DESCRIPTION: Creates a orange rectangular region at (322, 142) spanning 50 by 87 pixels.
; PLAN: r0=322(x), r1=142(y), r2=50(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 142
LDI r2, 50
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
