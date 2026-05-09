; DESCRIPTION: Creates a yellow rectangular region at (116, 177) spanning 92 by 27 pixels.
; PLAN: r0=116(x), r1=177(y), r2=92(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 177
LDI r2, 92
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
