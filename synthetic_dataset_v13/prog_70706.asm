; DESCRIPTION: Composite: Renders a yellow box of size 25x100 starting at (133, 108) then Sets a single cyan pixel at (479, 132) then Renders a red line between points (20, 138) and (264, 59).
; PLAN: r0=133(x), r1=108(y), r2=25(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=132(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=20(x1), r11=138(y1), r12=264(x2), r13=59(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 108
LDI r2, 25
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 132
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 138
LDI r12, 264
LDI r13, 59
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
