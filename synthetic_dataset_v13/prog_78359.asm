; DESCRIPTION: Composite: Renders a cyan line between points (11, 181) and (481, 86) then Places a green dot at position (299, 222).
; PLAN: r0=11(x1), r1=181(y1), r2=481(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 181
LDI r2, 481
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
