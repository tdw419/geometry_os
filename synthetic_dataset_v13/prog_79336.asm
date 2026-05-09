; DESCRIPTION: Composite: Places a magenta dot at position (433, 91) then Renders a red disk with center (220, 180) and radius 48.
; PLAN: r0=433(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=180(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 433
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 180
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
