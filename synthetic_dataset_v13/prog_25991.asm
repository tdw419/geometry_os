; DESCRIPTION: Composite: Places a red 56x24 rectangle at position (317, 212) then Renders a white line between points (437, 187) and (458, 12).
; PLAN: r0=317(x), r1=212(y), r2=56(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=187(y1), r7=458(x2), r8=12(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 212
LDI r2, 56
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 187
LDI r7, 458
LDI r8, 12
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
