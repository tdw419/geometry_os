; DESCRIPTION: Composite: Draws a red line from (211, 169) to (398, 197) then Renders a blue box of size 59x120 starting at (433, 92) then Sets a single green pixel at (81, 64).
; PLAN: r0=211(x1), r1=169(y1), r2=398(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=92(y), r7=59(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=64(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 169
LDI r2, 398
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 92
LDI r7, 59
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 64
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
