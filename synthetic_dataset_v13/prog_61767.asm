; DESCRIPTION: Creates a black rectangular region at (398, 17) spanning 113 by 52 pixels.
; PLAN: r0=398(x), r1=17(y), r2=113(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 17
LDI r2, 113
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
