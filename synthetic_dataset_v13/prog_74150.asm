; DESCRIPTION: Composite: Renders a purple disk with center (193, 159) and radius 60 then Renders a red line between points (140, 129) and (146, 70) then Places a green dot at position (168, 159).
; PLAN: r0=193(x), r1=159(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=129(y1), r7=146(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=159(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 159
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 129
LDI r7, 146
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 159
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
