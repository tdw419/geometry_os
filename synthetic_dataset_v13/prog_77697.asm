; DESCRIPTION: Composite: Draws a green line from (317, 51) to (437, 145) then Renders a cyan box of size 14x50 starting at (102, 162).
; PLAN: r0=317(x1), r1=51(y1), r2=437(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=162(y), r7=14(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 51
LDI r2, 437
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 162
LDI r7, 14
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
