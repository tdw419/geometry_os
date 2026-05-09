; DESCRIPTION: Composite: Renders a magenta line between points (208, 222) and (406, 215) then Places a green dot at position (399, 161).
; PLAN: r0=208(x1), r1=222(y1), r2=406(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=161(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 222
LDI r2, 406
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 161
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
