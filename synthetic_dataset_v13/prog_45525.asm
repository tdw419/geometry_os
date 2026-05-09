; DESCRIPTION: Composite: Places a magenta line segment connecting (228, 239) to (403, 254) then Creates a blue rectangular region at (211, 167) spanning 78 by 23 pixels then Sets a single cyan pixel at (77, 111).
; PLAN: r0=228(x1), r1=239(y1), r2=403(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=167(y), r7=78(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=77(x), r11=111(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 239
LDI r2, 403
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 167
LDI r7, 78
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 111
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
