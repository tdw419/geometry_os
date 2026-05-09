; DESCRIPTION: Composite: Creates a green rectangular region at (161, 10) spanning 104 by 67 pixels then Sets a single magenta pixel at (118, 133) then Draws a cyan line from (60, 86) to (479, 94).
; PLAN: r0=161(x), r1=10(y), r2=104(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=60(x1), r11=86(y1), r12=479(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 10
LDI r2, 104
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 86
LDI r12, 479
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
