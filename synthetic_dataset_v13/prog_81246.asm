; DESCRIPTION: Composite: Places a cyan 92x87 rectangle at position (30, 100) then Renders a red line between points (337, 193) and (241, 4).
; PLAN: r0=30(x), r1=100(y), r2=92(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x1), r6=193(y1), r7=241(x2), r8=4(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 100
LDI r2, 92
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 193
LDI r7, 241
LDI r8, 4
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
