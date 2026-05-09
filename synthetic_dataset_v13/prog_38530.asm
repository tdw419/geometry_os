; DESCRIPTION: Composite: Places a green dot at position (68, 7) then Creates a purple rectangular region at (273, 237) spanning 41 by 19 pixels.
; PLAN: r0=68(x), r1=7(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=237(y), r7=41(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 7
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 273
LDI r6, 237
LDI r7, 41
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
