; DESCRIPTION: Composite: Places a magenta dot at position (70, 12) then Renders a cyan box of size 65x37 starting at (417, 137) then Renders a orange line between points (108, 47) and (57, 7).
; PLAN: r0=70(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=137(y), r7=65(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x1), r11=47(y1), r12=57(x2), r13=7(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 137
LDI r7, 65
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 47
LDI r12, 57
LDI r13, 7
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
