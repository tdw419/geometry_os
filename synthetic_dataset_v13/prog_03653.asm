; DESCRIPTION: Creates a red rectangular region at (127, 44) spanning 31 by 72 pixels.
; PLAN: r0=127(x), r1=44(y), r2=31(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 44
LDI r2, 31
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
