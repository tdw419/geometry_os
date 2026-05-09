; DESCRIPTION: Creates a orange rectangular region at (90, 107) spanning 116 by 111 pixels.
; PLAN: r0=90(x), r1=107(y), r2=116(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 107
LDI r2, 116
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
