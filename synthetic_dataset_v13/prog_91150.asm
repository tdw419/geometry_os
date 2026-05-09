; DESCRIPTION: Creates a black rectangular region at (398, 22) spanning 103 by 72 pixels.
; PLAN: r0=398(x), r1=22(y), r2=103(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 22
LDI r2, 103
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
