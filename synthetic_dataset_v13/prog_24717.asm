; DESCRIPTION: Composite: Renders a magenta disk with center (123, 73) and radius 53 then Renders a red line between points (363, 216) and (93, 117) then Places a cyan 89x60 rectangle at position (249, 48).
; PLAN: r0=123(x), r1=73(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=216(y1), r7=93(x2), r8=117(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=48(y), r12=89(width), r13=60(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 73
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 216
LDI r7, 93
LDI r8, 117
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 48
LDI r12, 89
LDI r13, 60
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
