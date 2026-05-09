; DESCRIPTION: Composite: Places a magenta dot at position (223, 205) then Draws a cyan line from (499, 182) to (237, 208) then Places a white circle of radius 16 at center (79, 233).
; PLAN: r0=223(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=182(y1), r7=237(x2), r8=208(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=233(y), r12=16(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 223
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 499
LDI r6, 182
LDI r7, 237
LDI r8, 208
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 233
LDI r12, 16
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
