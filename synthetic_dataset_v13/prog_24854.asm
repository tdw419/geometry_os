; DESCRIPTION: Creates a yellow rectangular region at (398, 177) spanning 73 by 25 pixels.
; PLAN: r0=398(x), r1=177(y), r2=73(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 177
LDI r2, 73
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
