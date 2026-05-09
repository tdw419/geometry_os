; DESCRIPTION: Composite: Places a green dot at position (372, 31) then Creates a cyan rectangular region at (277, 143) spanning 60 by 19 pixels then Renders a magenta line between points (219, 174) and (132, 71).
; PLAN: r0=372(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=143(y), r7=60(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x1), r11=174(y1), r12=132(x2), r13=71(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 277
LDI r6, 143
LDI r7, 60
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 174
LDI r12, 132
LDI r13, 71
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
