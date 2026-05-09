; DESCRIPTION: Composite: Places a cyan dot at position (72, 169) then Draws a red line from (481, 90) to (239, 249) then Places a yellow circle of radius 23 at center (198, 118).
; PLAN: r0=72(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=481(x1), r6=90(y1), r7=239(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=118(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 481
LDI r6, 90
LDI r7, 239
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 118
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
