; DESCRIPTION: Creates a black rectangular region at (245, 25) spanning 50 by 92 pixels.
; PLAN: r0=245(x), r1=25(y), r2=50(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 25
LDI r2, 50
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
