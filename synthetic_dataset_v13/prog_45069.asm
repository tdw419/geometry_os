; DESCRIPTION: Creates a yellow rectangular region at (380, 52) spanning 86 by 92 pixels.
; PLAN: r0=380(x), r1=52(y), r2=86(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 52
LDI r2, 86
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
