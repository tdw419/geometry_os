; DESCRIPTION: Creates a orange rectangular region at (117, 112) spanning 90 by 71 pixels.
; PLAN: r0=117(x), r1=112(y), r2=90(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 112
LDI r2, 90
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
