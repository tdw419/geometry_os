; DESCRIPTION: Composite: Places a green 60x54 rectangle at position (201, 71) then Creates a red circular shape at (243, 242) with radius 13 then Draws a magenta line from (286, 250) to (477, 93).
; PLAN: r0=201(x), r1=71(y), r2=60(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=242(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=250(y1), r12=477(x2), r13=93(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 71
LDI r2, 60
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 242
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 250
LDI r12, 477
LDI r13, 93
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
