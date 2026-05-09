; DESCRIPTION: Creates a green rectangular region at (458, 133) spanning 44 by 109 pixels.
; PLAN: r0=458(x), r1=133(y), r2=44(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 133
LDI r2, 44
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
