; DESCRIPTION: Creates a yellow rectangular region at (92, 194) spanning 50 by 29 pixels.
; PLAN: r0=92(x), r1=194(y), r2=50(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 194
LDI r2, 50
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
