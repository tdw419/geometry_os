; DESCRIPTION: Composite: Places a green dot at position (502, 232) then Creates a blue rectangular region at (374, 71) spanning 117 by 62 pixels.
; PLAN: r0=502(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=71(y), r7=117(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 374
LDI r6, 71
LDI r7, 117
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
