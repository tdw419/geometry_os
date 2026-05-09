; DESCRIPTION: Composite: Renders a red disk with center (115, 149) and radius 74 then Draws a green line from (64, 176) to (384, 208).
; PLAN: r0=115(x), r1=149(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=176(y1), r7=384(x2), r8=208(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 149
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 176
LDI r7, 384
LDI r8, 208
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
