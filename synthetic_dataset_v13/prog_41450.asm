; DESCRIPTION: Composite: Draws a green line from (187, 71) to (368, 185) then Renders a cyan disk with center (456, 212) and radius 26.
; PLAN: r0=187(x1), r1=71(y1), r2=368(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=212(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 71
LDI r2, 368
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 212
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
