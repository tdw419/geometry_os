; DESCRIPTION: Composite: Places a purple 96x120 rectangle at position (106, 35) then Renders a black line between points (255, 87) and (146, 96).
; PLAN: r0=106(x), r1=35(y), r2=96(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=87(y1), r7=146(x2), r8=96(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 35
LDI r2, 96
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 87
LDI r7, 146
LDI r8, 96
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
