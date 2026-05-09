; DESCRIPTION: Creates a orange rectangular region at (143, 124) spanning 82 by 55 pixels.
; PLAN: r0=143(x), r1=124(y), r2=82(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 124
LDI r2, 82
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
