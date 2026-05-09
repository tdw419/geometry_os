; DESCRIPTION: Creates a yellow rectangular region at (298, 167) spanning 44 by 80 pixels.
; PLAN: r0=298(x), r1=167(y), r2=44(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 167
LDI r2, 44
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
