; DESCRIPTION: Creates a yellow rectangular region at (298, 151) spanning 110 by 105 pixels.
; PLAN: r0=298(x), r1=151(y), r2=110(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 151
LDI r2, 110
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
