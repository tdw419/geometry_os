; DESCRIPTION: Composite: Renders a black line between points (210, 113) and (394, 101) then Places a green dot at position (331, 68).
; PLAN: r0=210(x1), r1=113(y1), r2=394(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=68(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 113
LDI r2, 394
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 68
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
