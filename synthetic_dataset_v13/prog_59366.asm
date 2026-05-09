; DESCRIPTION: Composite: Sets a single cyan pixel at (50, 73) then Creates a white rectangular region at (211, 112) spanning 42 by 37 pixels then Draws a magenta line from (407, 73) to (433, 196).
; PLAN: r0=50(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=112(y), r7=42(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x1), r11=73(y1), r12=433(x2), r13=196(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 112
LDI r7, 42
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 73
LDI r12, 433
LDI r13, 196
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
