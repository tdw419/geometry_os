; DESCRIPTION: Creates a black rectangular region at (21, 141) spanning 117 by 10 pixels.
; PLAN: r0=21(x), r1=141(y), r2=117(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 141
LDI r2, 117
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
