; DESCRIPTION: Composite: Creates a purple rectangular region at (287, 187) spanning 39 by 47 pixels then Places a cyan line segment connecting (61, 220) to (102, 31) then Sets a single blue pixel at (59, 16).
; PLAN: r0=287(x), r1=187(y), r2=39(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=220(y1), r7=102(x2), r8=31(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=16(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 187
LDI r2, 39
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 220
LDI r7, 102
LDI r8, 31
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 16
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
