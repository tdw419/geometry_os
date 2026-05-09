; DESCRIPTION: Composite: Creates a yellow circular shape at (221, 149) with radius 73 then Places a magenta dot at position (470, 180).
; PLAN: r0=221(x), r1=149(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 149
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
