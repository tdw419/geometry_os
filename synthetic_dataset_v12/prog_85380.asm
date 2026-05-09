; DESCRIPTION: Composite: Renders a cyan box of size 56x100 starting at (428, 147) then Renders a green line between points (335, 37) and (300, 238).
; PLAN: r0=428(x), r1=147(y), r2=56(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=37(y1), r7=300(x2), r8=238(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 147
LDI r2, 56
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 37
LDI r7, 300
LDI r8, 238
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
