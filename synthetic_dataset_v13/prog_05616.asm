; DESCRIPTION: Composite: Places a black dot at position (395, 185) then Renders a purple box of size 105x71 starting at (152, 21).
; PLAN: r0=395(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=21(y), r7=105(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 21
LDI r7, 105
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
