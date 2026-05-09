; DESCRIPTION: Composite: Places a cyan dot at position (82, 45) then Places a green 23x117 rectangle at position (90, 10) then Renders a purple line between points (198, 155) and (33, 34).
; PLAN: r0=82(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=10(y), r7=23(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x1), r11=155(y1), r12=33(x2), r13=34(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 10
LDI r7, 23
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 155
LDI r12, 33
LDI r13, 34
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
