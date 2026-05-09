; DESCRIPTION: Creates a red rectangular region at (145, 107) spanning 90 by 27 pixels.
; PLAN: r0=145(x), r1=107(y), r2=90(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 107
LDI r2, 90
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
