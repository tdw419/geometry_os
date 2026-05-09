; DESCRIPTION: Creates a yellow rectangular region at (178, 210) spanning 90 by 25 pixels.
; PLAN: r0=178(x), r1=210(y), r2=90(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 210
LDI r2, 90
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
