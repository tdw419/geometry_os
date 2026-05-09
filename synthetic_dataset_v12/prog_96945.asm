; DESCRIPTION: Composite: Renders a cyan line between points (11, 73) and (317, 243) then Renders a magenta disk with center (21, 33) and radius 19 then Places a magenta dot at position (1, 63).
; PLAN: r0=11(x1), r1=73(y1), r2=317(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=33(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=63(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 73
LDI r2, 317
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 33
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 63
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
