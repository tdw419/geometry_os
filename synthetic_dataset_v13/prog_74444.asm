; DESCRIPTION: Composite: Renders a yellow disk with center (152, 158) and radius 42 then Renders a cyan line between points (391, 236) and (221, 184).
; PLAN: r0=152(x), r1=158(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=236(y1), r7=221(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 158
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 236
LDI r7, 221
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
