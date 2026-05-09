; DESCRIPTION: Composite: Places a white line segment connecting (137, 236) to (234, 34) then Places a cyan dot at position (73, 124) then Creates a magenta rectangular region at (152, 78) spanning 50 by 80 pixels.
; PLAN: r0=137(x1), r1=236(y1), r2=234(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=124(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=78(y), r12=50(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 236
LDI r2, 234
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 124
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 152
LDI r11, 78
LDI r12, 50
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
