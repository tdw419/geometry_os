; DESCRIPTION: Composite: Renders a cyan box of size 86x65 starting at (369, 2) then Renders a black line between points (262, 180) and (423, 196).
; PLAN: r0=369(x), r1=2(y), r2=86(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=180(y1), r7=423(x2), r8=196(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 2
LDI r2, 86
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 180
LDI r7, 423
LDI r8, 196
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
