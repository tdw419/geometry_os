; DESCRIPTION: Composite: Sets a single green pixel at (45, 220) then Renders a blue line between points (67, 209) and (215, 12).
; PLAN: r0=45(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=67(x1), r6=209(y1), r7=215(x2), r8=12(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 67
LDI r6, 209
LDI r7, 215
LDI r8, 12
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
