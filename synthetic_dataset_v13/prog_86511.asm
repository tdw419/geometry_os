; DESCRIPTION: Composite: Places a red dot at position (93, 37) then Renders a cyan line between points (283, 243) and (475, 4) then Creates a green rectangular region at (215, 7) spanning 92 by 91 pixels.
; PLAN: r0=93(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=243(y1), r7=475(x2), r8=4(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=7(y), r12=92(width), r13=91(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 37
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 283
LDI r6, 243
LDI r7, 475
LDI r8, 4
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 7
LDI r12, 92
LDI r13, 91
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
