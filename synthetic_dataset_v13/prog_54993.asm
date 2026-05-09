; DESCRIPTION: Composite: Places a blue dot at position (78, 7) then Renders a black box of size 97x97 starting at (54, 61) then Renders a yellow line between points (405, 47) and (90, 193).
; PLAN: r0=78(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=61(y), r7=97(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x1), r11=47(y1), r12=90(x2), r13=193(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 61
LDI r7, 97
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 47
LDI r12, 90
LDI r13, 193
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
