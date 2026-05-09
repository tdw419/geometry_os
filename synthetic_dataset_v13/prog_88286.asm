; DESCRIPTION: Composite: Draws a green line from (31, 108) to (454, 63) then Renders a cyan disk with center (215, 195) and radius 58.
; PLAN: r0=31(x1), r1=108(y1), r2=454(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=195(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 108
LDI r2, 454
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 195
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
