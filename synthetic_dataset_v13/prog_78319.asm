; DESCRIPTION: Creates a green rectangular region at (60, 4) spanning 77 by 104 pixels.
; PLAN: r0=60(x), r1=4(y), r2=77(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 4
LDI r2, 77
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
