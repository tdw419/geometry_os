; DESCRIPTION: Creates a yellow rectangular region at (304, 195) spanning 77 by 20 pixels.
; PLAN: r0=304(x), r1=195(y), r2=77(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 195
LDI r2, 77
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
