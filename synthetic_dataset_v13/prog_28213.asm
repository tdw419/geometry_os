; DESCRIPTION: Creates a black rectangular region at (386, 8) spanning 44 by 96 pixels.
; PLAN: r0=386(x), r1=8(y), r2=44(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 8
LDI r2, 44
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
