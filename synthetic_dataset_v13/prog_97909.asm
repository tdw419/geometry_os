; DESCRIPTION: Composite: Places a red dot at position (117, 215) then Renders a blue line between points (500, 49) and (218, 148).
; PLAN: r0=117(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=49(y1), r7=218(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 500
LDI r6, 49
LDI r7, 218
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
