; DESCRIPTION: Creates a red rectangular region at (418, 98) spanning 92 by 68 pixels.
; PLAN: r0=418(x), r1=98(y), r2=92(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 98
LDI r2, 92
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
