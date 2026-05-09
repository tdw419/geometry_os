; DESCRIPTION: Composite: Renders a magenta line between points (32, 99) and (268, 240) then Places a white dot at position (271, 134).
; PLAN: r0=32(x1), r1=99(y1), r2=268(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=134(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 99
LDI r2, 268
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 134
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
