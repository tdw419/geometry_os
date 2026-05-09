; DESCRIPTION: Composite: Places a purple line segment connecting (377, 5) to (263, 53) then Renders a white box of size 120x51 starting at (308, 48) then Places a cyan dot at position (363, 61).
; PLAN: r0=377(x1), r1=5(y1), r2=263(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=48(y), r7=120(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x), r11=61(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 5
LDI r2, 263
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 48
LDI r7, 120
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 61
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
