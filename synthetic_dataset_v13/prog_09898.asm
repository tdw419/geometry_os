; DESCRIPTION: Composite: Draws a cyan line from (377, 102) to (457, 130) then Places a green dot at position (243, 43).
; PLAN: r0=377(x1), r1=102(y1), r2=457(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=43(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 102
LDI r2, 457
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 43
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
