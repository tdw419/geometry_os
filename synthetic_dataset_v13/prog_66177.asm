; DESCRIPTION: Composite: Sets a single yellow pixel at (445, 168) then Renders a blue line between points (256, 56) and (174, 168) then Places a purple 98x59 rectangle at position (229, 160).
; PLAN: r0=445(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=256(x1), r6=56(y1), r7=174(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=160(y), r12=98(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 256
LDI r6, 56
LDI r7, 174
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 160
LDI r12, 98
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
