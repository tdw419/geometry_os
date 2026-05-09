; DESCRIPTION: Composite: Draws a cyan line from (33, 177) to (461, 152) then Places a blue circle of radius 27 at center (286, 63).
; PLAN: r0=33(x1), r1=177(y1), r2=461(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=63(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 177
LDI r2, 461
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 63
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
