; DESCRIPTION: Composite: Places a white circle of radius 62 at center (323, 149) then Renders a green box of size 22x75 starting at (94, 111).
; PLAN: r0=323(x), r1=149(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=111(y), r7=22(width), r8=75(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 149
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 111
LDI r7, 22
LDI r8, 75
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
