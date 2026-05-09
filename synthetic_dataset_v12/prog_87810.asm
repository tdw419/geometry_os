; DESCRIPTION: Creates a green rectangular region at (391, 4) spanning 71 by 47 pixels.
; PLAN: r0=391(x), r1=4(y), r2=71(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 4
LDI r2, 71
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
