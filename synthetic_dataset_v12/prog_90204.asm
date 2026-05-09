; DESCRIPTION: Creates a red rectangular region at (177, 220) spanning 66 by 23 pixels.
; PLAN: r0=177(x), r1=220(y), r2=66(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 220
LDI r2, 66
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
