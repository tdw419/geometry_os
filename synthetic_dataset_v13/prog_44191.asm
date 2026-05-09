; DESCRIPTION: Composite: Draws a cyan line from (308, 29) to (180, 126) then Renders a purple box of size 100x119 starting at (387, 7).
; PLAN: r0=308(x1), r1=29(y1), r2=180(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=7(y), r7=100(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 29
LDI r2, 180
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 7
LDI r7, 100
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
