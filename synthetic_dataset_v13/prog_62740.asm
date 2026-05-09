; DESCRIPTION: Composite: Places a magenta 104x63 rectangle at position (378, 69) then Draws a magenta line from (34, 47) to (102, 92) then Places a magenta dot at position (161, 197).
; PLAN: r0=378(x), r1=69(y), r2=104(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=47(y1), r7=102(x2), r8=92(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=197(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 69
LDI r2, 104
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 47
LDI r7, 102
LDI r8, 92
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 197
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
