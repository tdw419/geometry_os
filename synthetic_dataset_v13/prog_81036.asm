; DESCRIPTION: Composite: Draws a magenta line from (298, 133) to (108, 131) then Draws a cyan circle centered at (170, 122) with radius 71.
; PLAN: r0=298(x1), r1=133(y1), r2=108(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=122(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 133
LDI r2, 108
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 122
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
