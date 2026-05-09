; DESCRIPTION: Composite: Renders a purple box of size 91x56 starting at (193, 166) then Draws a cyan line from (149, 119) to (262, 15).
; PLAN: r0=193(x), r1=166(y), r2=91(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=119(y1), r7=262(x2), r8=15(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 166
LDI r2, 91
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 119
LDI r7, 262
LDI r8, 15
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
