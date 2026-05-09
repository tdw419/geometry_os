; DESCRIPTION: Composite: Places a red circle of radius 58 at center (413, 120) then Renders a yellow box of size 71x50 starting at (426, 131).
; PLAN: r0=413(x), r1=120(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=131(y), r7=71(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 120
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 131
LDI r7, 71
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
