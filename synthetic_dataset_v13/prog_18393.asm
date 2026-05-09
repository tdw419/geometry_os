; DESCRIPTION: Creates a red rectangular region at (368, 114) spanning 62 by 68 pixels.
; PLAN: r0=368(x), r1=114(y), r2=62(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 114
LDI r2, 62
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
