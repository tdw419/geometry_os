; DESCRIPTION: Composite: Draws a blue line from (401, 145) to (199, 35) then Places a blue dot at position (225, 208) then Places a orange 75x116 rectangle at position (46, 66).
; PLAN: r0=401(x1), r1=145(y1), r2=199(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=208(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=66(y), r12=75(width), r13=116(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 145
LDI r2, 199
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 208
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 66
LDI r12, 75
LDI r13, 116
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
