; DESCRIPTION: Composite: Renders a orange line between points (442, 86) and (200, 221) then Places a green dot at position (243, 149).
; PLAN: r0=442(x1), r1=86(y1), r2=200(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=149(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 86
LDI r2, 200
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 149
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
