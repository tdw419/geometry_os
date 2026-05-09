; DESCRIPTION: Creates a yellow rectangular region at (212, 120) spanning 61 by 65 pixels.
; PLAN: r0=212(x), r1=120(y), r2=61(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 120
LDI r2, 61
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
