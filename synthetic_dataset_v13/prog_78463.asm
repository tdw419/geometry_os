; DESCRIPTION: Creates a green rectangular region at (207, 94) spanning 27 by 93 pixels.
; PLAN: r0=207(x), r1=94(y), r2=27(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 94
LDI r2, 27
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
