; DESCRIPTION: Creates a red rectangular region at (428, 58) spanning 39 by 44 pixels.
; PLAN: r0=428(x), r1=58(y), r2=39(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 58
LDI r2, 39
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
