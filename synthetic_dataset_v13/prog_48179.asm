; DESCRIPTION: Composite: Places a white circle of radius 36 at center (277, 64) then Renders a green box of size 69x93 starting at (54, 111).
; PLAN: r0=277(x), r1=64(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=111(y), r7=69(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 64
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 111
LDI r7, 69
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
