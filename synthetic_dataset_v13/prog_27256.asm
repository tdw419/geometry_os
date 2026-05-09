; DESCRIPTION: Creates a black rectangular region at (300, 3) spanning 48 by 113 pixels.
; PLAN: r0=300(x), r1=3(y), r2=48(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 3
LDI r2, 48
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
