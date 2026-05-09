; DESCRIPTION: Composite: Draws a magenta line from (307, 184) to (239, 190) then Places a magenta dot at position (208, 20) then Renders a green disk with center (148, 71) and radius 39.
; PLAN: r0=307(x1), r1=184(y1), r2=239(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=71(y), r12=39(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 184
LDI r2, 239
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 148
LDI r11, 71
LDI r12, 39
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
