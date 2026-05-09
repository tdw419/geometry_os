; DESCRIPTION: Composite: Renders a black box of size 98x50 starting at (222, 31) then Sets a single black pixel at (21, 111).
; PLAN: r0=222(x), r1=31(y), r2=98(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=111(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 31
LDI r2, 98
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 111
LDI r7, 0x000000
PSET r5, r6, r7
HALT
