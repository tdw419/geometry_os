; DESCRIPTION: Composite: Creates a blue circular shape at (392, 82) with radius 56 then Draws a white line from (413, 120) to (433, 66).
; PLAN: r0=392(x), r1=82(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x1), r6=120(y1), r7=433(x2), r8=66(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 82
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 120
LDI r7, 433
LDI r8, 66
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
