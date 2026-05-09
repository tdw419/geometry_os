; DESCRIPTION: Composite: Places a red line segment connecting (182, 40) to (61, 44) then Renders a magenta box of size 54x47 starting at (228, 8) then Sets a single green pixel at (295, 122).
; PLAN: r0=182(x1), r1=40(y1), r2=61(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=8(y), r7=54(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=122(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 40
LDI r2, 61
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 8
LDI r7, 54
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 122
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
