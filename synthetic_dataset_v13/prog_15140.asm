; DESCRIPTION: Composite: Places a black dot at position (450, 23) then Renders a blue line between points (425, 54) and (213, 134).
; PLAN: r0=450(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=425(x1), r6=54(y1), r7=213(x2), r8=134(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 425
LDI r6, 54
LDI r7, 213
LDI r8, 134
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
