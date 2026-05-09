; DESCRIPTION: Creates a green rectangular region at (74, 109) spanning 77 by 47 pixels.
; PLAN: r0=74(x), r1=109(y), r2=77(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 109
LDI r2, 77
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
