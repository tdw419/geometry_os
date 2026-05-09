; DESCRIPTION: Composite: Draws a green line from (133, 242) to (337, 28) then Places a cyan dot at position (390, 77) then Renders a blue box of size 50x35 starting at (83, 16).
; PLAN: r0=133(x1), r1=242(y1), r2=337(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=77(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=16(y), r12=50(width), r13=35(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 242
LDI r2, 337
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 77
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 83
LDI r11, 16
LDI r12, 50
LDI r13, 35
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
