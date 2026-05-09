; DESCRIPTION: Creates a black rectangular region at (323, 59) spanning 109 by 77 pixels.
; PLAN: r0=323(x), r1=59(y), r2=109(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 59
LDI r2, 109
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
