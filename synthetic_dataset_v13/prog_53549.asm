; DESCRIPTION: Composite: Renders a red line between points (286, 12) and (202, 191) then Places a purple 91x103 rectangle at position (269, 38) then Places a green dot at position (379, 19).
; PLAN: r0=286(x1), r1=12(y1), r2=202(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=38(y), r7=91(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 12
LDI r2, 202
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 38
LDI r7, 91
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
