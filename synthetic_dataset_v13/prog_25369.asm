; DESCRIPTION: Creates a yellow rectangular region at (39, 172) spanning 103 by 36 pixels.
; PLAN: r0=39(x), r1=172(y), r2=103(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 172
LDI r2, 103
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
