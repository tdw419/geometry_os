; DESCRIPTION: Creates a green rectangular region at (298, 122) spanning 104 by 53 pixels.
; PLAN: r0=298(x), r1=122(y), r2=104(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 122
LDI r2, 104
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
