; DESCRIPTION: Creates a black rectangular region at (154, 137) spanning 120 by 100 pixels.
; PLAN: r0=154(x), r1=137(y), r2=120(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 137
LDI r2, 120
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
