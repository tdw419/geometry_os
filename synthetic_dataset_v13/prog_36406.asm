; DESCRIPTION: Creates a cyan rectangular region at (382, 54) spanning 75 by 101 pixels.
; PLAN: r0=382(x), r1=54(y), r2=75(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 54
LDI r2, 75
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
