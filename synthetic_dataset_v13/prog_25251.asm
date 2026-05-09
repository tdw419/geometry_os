; DESCRIPTION: Creates a red rectangular region at (323, 154) spanning 58 by 98 pixels.
; PLAN: r0=323(x), r1=154(y), r2=58(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 154
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
