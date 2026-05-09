; DESCRIPTION: Composite: Places a blue circle of radius 77 at center (335, 168) then Renders a red box of size 84x74 starting at (81, 109).
; PLAN: r0=335(x), r1=168(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=109(y), r7=84(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 168
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 109
LDI r7, 84
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
