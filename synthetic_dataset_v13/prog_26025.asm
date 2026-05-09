; DESCRIPTION: Composite: Places a blue line segment connecting (143, 5) to (438, 82) then Renders a cyan box of size 53x59 starting at (420, 167) then Sets a single black pixel at (167, 47).
; PLAN: r0=143(x1), r1=5(y1), r2=438(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=167(y), r7=53(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x), r11=47(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 5
LDI r2, 438
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 167
LDI r7, 53
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 47
LDI r12, 0x000000
PSET r10, r11, r12
HALT
