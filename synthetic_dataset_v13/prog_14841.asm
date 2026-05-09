; DESCRIPTION: Composite: Places a cyan line segment connecting (319, 234) to (210, 227) then Renders a purple disk with center (238, 97) and radius 42 then Places a purple dot at position (502, 47).
; PLAN: r0=319(x1), r1=234(y1), r2=210(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=97(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x), r11=47(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 234
LDI r2, 210
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 97
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 47
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
