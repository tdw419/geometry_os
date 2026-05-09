; DESCRIPTION: Composite: Renders a purple disk with center (33, 86) and radius 28 then Renders a orange line between points (333, 164) and (196, 69) then Places a purple dot at position (392, 190).
; PLAN: r0=33(x), r1=86(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x1), r6=164(y1), r7=196(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=190(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 86
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 164
LDI r7, 196
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 190
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
