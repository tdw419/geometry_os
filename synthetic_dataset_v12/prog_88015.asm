; DESCRIPTION: Creates a black rectangular region at (130, 209) spanning 33 by 11 pixels.
; PLAN: r0=130(x), r1=209(y), r2=33(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 209
LDI r2, 33
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
