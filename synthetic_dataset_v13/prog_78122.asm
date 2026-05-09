; DESCRIPTION: Creates a red rectangular region at (240, 169) spanning 67 by 77 pixels.
; PLAN: r0=240(x), r1=169(y), r2=67(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 169
LDI r2, 67
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
