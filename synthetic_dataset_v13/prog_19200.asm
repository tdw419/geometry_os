; DESCRIPTION: Creates a yellow rectangular region at (368, 194) spanning 93 by 57 pixels.
; PLAN: r0=368(x), r1=194(y), r2=93(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 194
LDI r2, 93
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
