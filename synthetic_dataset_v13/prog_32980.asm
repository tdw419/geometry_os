; DESCRIPTION: Composite: Places a purple dot at position (186, 108) then Renders a yellow line between points (277, 171) and (397, 91).
; PLAN: r0=186(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=277(x1), r6=171(y1), r7=397(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 171
LDI r7, 397
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
