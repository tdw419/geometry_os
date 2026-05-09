; DESCRIPTION: Composite: Places a black 120x61 rectangle at position (6, 155) then Renders a black line between points (362, 163) and (300, 212).
; PLAN: r0=6(x), r1=155(y), r2=120(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=163(y1), r7=300(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 155
LDI r2, 120
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 163
LDI r7, 300
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
