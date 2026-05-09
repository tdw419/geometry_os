; DESCRIPTION: Creates a black rectangular region at (202, 1) spanning 14 by 14 pixels.
; PLAN: r0=202(x), r1=1(y), r2=14(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 1
LDI r2, 14
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
