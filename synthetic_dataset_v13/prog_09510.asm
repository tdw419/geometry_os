; DESCRIPTION: Creates a green rectangular region at (171, 30) spanning 28 by 109 pixels.
; PLAN: r0=171(x), r1=30(y), r2=28(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 30
LDI r2, 28
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
