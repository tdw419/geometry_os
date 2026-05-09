; DESCRIPTION: Composite: Sets a single cyan pixel at (365, 190) then Draws a white line from (101, 58) to (187, 225) then Renders a magenta disk with center (111, 202) and radius 14.
; PLAN: r0=365(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=58(y1), r7=187(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=202(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 58
LDI r7, 187
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 202
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
