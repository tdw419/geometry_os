; DESCRIPTION: Composite: Places a purple dot at position (205, 120) then Places a green 43x26 rectangle at position (160, 28) then Renders a green line between points (245, 216) and (198, 169).
; PLAN: r0=205(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=28(y), r7=43(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x1), r11=216(y1), r12=198(x2), r13=169(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 28
LDI r7, 43
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 216
LDI r12, 198
LDI r13, 169
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
