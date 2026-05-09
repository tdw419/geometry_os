; DESCRIPTION: Composite: Sets a single green pixel at (270, 142) then Places a blue line segment connecting (138, 27) to (298, 210).
; PLAN: r0=270(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=138(x1), r6=27(y1), r7=298(x2), r8=210(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 27
LDI r7, 298
LDI r8, 210
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
