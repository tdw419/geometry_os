; DESCRIPTION: Composite: Renders a yellow box of size 56x113 starting at (127, 84) then Renders a red line between points (87, 78) and (70, 120).
; PLAN: r0=127(x), r1=84(y), r2=56(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=78(y1), r7=70(x2), r8=120(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 84
LDI r2, 56
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 78
LDI r7, 70
LDI r8, 120
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
