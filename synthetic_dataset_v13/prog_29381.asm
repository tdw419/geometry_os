; DESCRIPTION: Composite: Draws a cyan line from (317, 105) to (96, 17) then Renders a green box of size 82x74 starting at (121, 21).
; PLAN: r0=317(x1), r1=105(y1), r2=96(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=21(y), r7=82(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 105
LDI r2, 96
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 21
LDI r7, 82
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
