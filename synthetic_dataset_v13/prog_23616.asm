; DESCRIPTION: Composite: Renders a green box of size 102x97 starting at (106, 105) then Sets a single red pixel at (284, 143).
; PLAN: r0=106(x), r1=105(y), r2=102(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=143(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 105
LDI r2, 102
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 143
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
