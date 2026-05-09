; DESCRIPTION: Creates a white rectangular region at (412, 137) spanning 10 by 82 pixels.
; PLAN: r0=412(x), r1=137(y), r2=10(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 137
LDI r2, 10
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
