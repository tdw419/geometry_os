; DESCRIPTION: Composite: Places a green dot at position (75, 201) then Renders a green box of size 52x69 starting at (308, 27) then Renders a red line between points (128, 220) and (470, 128).
; PLAN: r0=75(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=27(y), r7=52(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x1), r11=220(y1), r12=470(x2), r13=128(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 201
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 27
LDI r7, 52
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 220
LDI r12, 470
LDI r13, 128
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
