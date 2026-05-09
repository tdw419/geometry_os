; DESCRIPTION: Composite: Renders a green line between points (87, 106) and (63, 23) then Places a cyan circle of radius 76 at center (193, 103).
; PLAN: r0=87(x1), r1=106(y1), r2=63(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=103(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 106
LDI r2, 63
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 103
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
