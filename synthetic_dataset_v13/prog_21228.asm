; DESCRIPTION: Composite: Places a green dot at position (290, 63) then Draws a green line from (121, 87) to (380, 218) then Creates a cyan rectangular region at (23, 46) spanning 75 by 12 pixels.
; PLAN: r0=290(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=87(y1), r7=380(x2), r8=218(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=46(y), r12=75(width), r13=12(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 121
LDI r6, 87
LDI r7, 380
LDI r8, 218
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 46
LDI r12, 75
LDI r13, 12
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
