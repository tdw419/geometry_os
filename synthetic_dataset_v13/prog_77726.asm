; DESCRIPTION: Creates a black rectangular region at (123, 202) spanning 18 by 22 pixels.
; PLAN: r0=123(x), r1=202(y), r2=18(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 202
LDI r2, 18
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
