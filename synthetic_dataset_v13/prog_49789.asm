; DESCRIPTION: Creates a green rectangular region at (323, 27) spanning 61 by 109 pixels.
; PLAN: r0=323(x), r1=27(y), r2=61(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 27
LDI r2, 61
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
