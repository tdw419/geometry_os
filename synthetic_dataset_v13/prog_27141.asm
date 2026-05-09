; DESCRIPTION: Creates a black rectangular region at (386, 40) spanning 28 by 65 pixels.
; PLAN: r0=386(x), r1=40(y), r2=28(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 40
LDI r2, 28
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
