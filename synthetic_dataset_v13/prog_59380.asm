; DESCRIPTION: Creates a black rectangular region at (465, 51) spanning 46 by 87 pixels.
; PLAN: r0=465(x), r1=51(y), r2=46(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 51
LDI r2, 46
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
