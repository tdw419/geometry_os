; DESCRIPTION: Creates a red rectangular region at (240, 186) spanning 44 by 43 pixels.
; PLAN: r0=240(x), r1=186(y), r2=44(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 186
LDI r2, 44
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
