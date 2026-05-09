; DESCRIPTION: Creates a green rectangular region at (482, 140) spanning 27 by 45 pixels.
; PLAN: r0=482(x), r1=140(y), r2=27(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 140
LDI r2, 27
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
