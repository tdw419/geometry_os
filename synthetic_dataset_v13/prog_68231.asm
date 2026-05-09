; DESCRIPTION: Composite: Renders a green line between points (400, 149) and (442, 4) then Places a green dot at position (213, 226).
; PLAN: r0=400(x1), r1=149(y1), r2=442(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=226(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 149
LDI r2, 442
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 226
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
