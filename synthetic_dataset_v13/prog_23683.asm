; DESCRIPTION: Composite: Draws a magenta line from (228, 89) to (469, 40) then Renders a cyan box of size 104x68 starting at (267, 67) then Sets a single yellow pixel at (241, 98).
; PLAN: r0=228(x1), r1=89(y1), r2=469(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=67(y), r7=104(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=98(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 89
LDI r2, 469
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 67
LDI r7, 104
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 98
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
