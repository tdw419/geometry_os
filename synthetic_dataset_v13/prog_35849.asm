; DESCRIPTION: Composite: Places a yellow line segment connecting (120, 221) to (223, 39) then Places a magenta dot at position (442, 35).
; PLAN: r0=120(x1), r1=221(y1), r2=223(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=35(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 221
LDI r2, 223
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 35
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
