; DESCRIPTION: Composite: Renders a green box of size 48x42 starting at (207, 66) then Places a cyan dot at position (216, 7) then Renders a green line between points (220, 53) and (312, 94).
; PLAN: r0=207(x), r1=66(y), r2=48(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=7(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=220(x1), r11=53(y1), r12=312(x2), r13=94(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 66
LDI r2, 48
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 7
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 53
LDI r12, 312
LDI r13, 94
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
