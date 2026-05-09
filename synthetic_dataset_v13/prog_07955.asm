; DESCRIPTION: Composite: Draws a green line from (417, 230) to (474, 150) then Places a cyan dot at position (14, 127) then Places a purple 46x38 rectangle at position (69, 205).
; PLAN: r0=417(x1), r1=230(y1), r2=474(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=205(y), r12=46(width), r13=38(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 230
LDI r2, 474
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 69
LDI r11, 205
LDI r12, 46
LDI r13, 38
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
