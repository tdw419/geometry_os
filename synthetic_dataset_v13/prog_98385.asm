; DESCRIPTION: Creates a black rectangular region at (298, 67) spanning 105 by 52 pixels.
; PLAN: r0=298(x), r1=67(y), r2=105(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 67
LDI r2, 105
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
