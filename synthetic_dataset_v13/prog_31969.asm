; DESCRIPTION: Creates a green rectangular region at (211, 197) spanning 109 by 31 pixels.
; PLAN: r0=211(x), r1=197(y), r2=109(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 197
LDI r2, 109
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
