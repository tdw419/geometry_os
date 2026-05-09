; DESCRIPTION: Composite: Draws a cyan line from (108, 124) to (337, 160) then Places a green dot at position (114, 23).
; PLAN: r0=108(x1), r1=124(y1), r2=337(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=23(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 124
LDI r2, 337
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 23
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
