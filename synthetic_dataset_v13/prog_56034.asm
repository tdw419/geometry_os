; DESCRIPTION: Composite: Places a blue dot at position (425, 219) then Renders a blue line between points (442, 49) and (113, 204).
; PLAN: r0=425(x), r1=219(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=49(y1), r7=113(x2), r8=204(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 219
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 49
LDI r7, 113
LDI r8, 204
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
