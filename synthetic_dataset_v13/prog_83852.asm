; DESCRIPTION: Composite: Creates a red circular shape at (349, 71) with radius 57 then Places a cyan line segment connecting (189, 15) to (331, 111).
; PLAN: r0=349(x), r1=71(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=15(y1), r7=331(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 71
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 15
LDI r7, 331
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
