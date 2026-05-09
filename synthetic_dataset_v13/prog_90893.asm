; DESCRIPTION: Creates a black rectangular region at (46, 52) spanning 54 by 58 pixels.
; PLAN: r0=46(x), r1=52(y), r2=54(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 52
LDI r2, 54
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
