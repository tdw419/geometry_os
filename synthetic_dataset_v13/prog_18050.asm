; DESCRIPTION: Composite: Renders a cyan line between points (124, 244) and (277, 193) then Creates a red rectangular region at (211, 92) spanning 114 by 104 pixels then Places a purple dot at position (243, 175).
; PLAN: r0=124(x1), r1=244(y1), r2=277(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=92(y), r7=114(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=175(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 244
LDI r2, 277
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 92
LDI r7, 114
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 175
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
