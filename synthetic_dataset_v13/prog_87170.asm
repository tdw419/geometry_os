; DESCRIPTION: Composite: Places a red 117x95 rectangle at position (95, 92) then Draws a yellow line from (317, 184) to (492, 173).
; PLAN: r0=95(x), r1=92(y), r2=117(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=184(y1), r7=492(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 92
LDI r2, 117
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 184
LDI r7, 492
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
