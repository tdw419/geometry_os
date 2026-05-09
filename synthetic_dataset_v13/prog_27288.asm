; DESCRIPTION: Creates a yellow rectangular region at (335, 212) spanning 90 by 42 pixels.
; PLAN: r0=335(x), r1=212(y), r2=90(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 212
LDI r2, 90
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
