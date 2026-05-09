; DESCRIPTION: Composite: Renders a white line between points (451, 228) and (310, 218) then Renders a red box of size 107x78 starting at (27, 111).
; PLAN: r0=451(x1), r1=228(y1), r2=310(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=111(y), r7=107(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 228
LDI r2, 310
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 111
LDI r7, 107
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
