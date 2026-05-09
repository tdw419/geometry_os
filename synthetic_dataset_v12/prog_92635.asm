; DESCRIPTION: Composite: Places a magenta dot at position (237, 122) then Renders a red line between points (270, 39) and (382, 214).
; PLAN: r0=237(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=270(x1), r6=39(y1), r7=382(x2), r8=214(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 39
LDI r7, 382
LDI r8, 214
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
