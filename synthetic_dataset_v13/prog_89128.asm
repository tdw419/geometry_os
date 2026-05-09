; DESCRIPTION: Composite: Renders a green box of size 120x87 starting at (149, 153) then Places a blue line segment connecting (317, 61) to (245, 190) then Places a red dot at position (434, 220).
; PLAN: r0=149(x), r1=153(y), r2=120(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=61(y1), r7=245(x2), r8=190(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=220(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 153
LDI r2, 120
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 61
LDI r7, 245
LDI r8, 190
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 220
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
