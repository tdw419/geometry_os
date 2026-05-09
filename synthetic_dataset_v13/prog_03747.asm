; DESCRIPTION: Composite: Places a green line segment connecting (37, 147) to (10, 107) then Places a blue 73x57 rectangle at position (71, 78).
; PLAN: r0=37(x1), r1=147(y1), r2=10(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=78(y), r7=73(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 147
LDI r2, 10
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 78
LDI r7, 73
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
