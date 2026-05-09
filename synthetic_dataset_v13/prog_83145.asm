; DESCRIPTION: Creates a green rectangular region at (273, 111) spanning 93 by 68 pixels.
; PLAN: r0=273(x), r1=111(y), r2=93(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 111
LDI r2, 93
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
