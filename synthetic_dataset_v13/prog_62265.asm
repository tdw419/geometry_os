; DESCRIPTION: Composite: Renders a magenta box of size 56x83 starting at (450, 90) then Renders a black line between points (330, 85) and (10, 2).
; PLAN: r0=450(x), r1=90(y), r2=56(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x1), r6=85(y1), r7=10(x2), r8=2(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 90
LDI r2, 56
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 85
LDI r7, 10
LDI r8, 2
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
