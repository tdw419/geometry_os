; DESCRIPTION: Creates a black rectangular region at (243, 15) spanning 28 by 77 pixels.
; PLAN: r0=243(x), r1=15(y), r2=28(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 15
LDI r2, 28
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
