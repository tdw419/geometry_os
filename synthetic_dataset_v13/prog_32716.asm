; DESCRIPTION: Creates a green rectangular region at (465, 31) spanning 25 by 82 pixels.
; PLAN: r0=465(x), r1=31(y), r2=25(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 31
LDI r2, 25
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
