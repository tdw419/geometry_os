; DESCRIPTION: Creates a yellow rectangular region at (151, 186) spanning 45 by 18 pixels.
; PLAN: r0=151(x), r1=186(y), r2=45(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 186
LDI r2, 45
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
