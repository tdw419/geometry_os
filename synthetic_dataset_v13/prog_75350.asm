; DESCRIPTION: Composite: Sets a single black pixel at (195, 172) then Renders a white line between points (4, 14) and (392, 168) then Renders a green box of size 39x39 starting at (128, 107).
; PLAN: r0=195(x), r1=172(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=14(y1), r7=392(x2), r8=168(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=107(y), r12=39(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 172
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 4
LDI r6, 14
LDI r7, 392
LDI r8, 168
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 107
LDI r12, 39
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
