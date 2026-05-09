; DESCRIPTION: Composite: Places a purple dot at position (327, 186) then Creates a green rectangular region at (33, 48) spanning 24 by 86 pixels.
; PLAN: r0=327(x), r1=186(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=48(y), r7=24(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 186
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 48
LDI r7, 24
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
