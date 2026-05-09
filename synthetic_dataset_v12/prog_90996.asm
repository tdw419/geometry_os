; DESCRIPTION: Composite: Places a green 94x62 rectangle at position (82, 112) then Renders a yellow line between points (79, 251) and (449, 66).
; PLAN: r0=82(x), r1=112(y), r2=94(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=251(y1), r7=449(x2), r8=66(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 112
LDI r2, 94
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 251
LDI r7, 449
LDI r8, 66
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
