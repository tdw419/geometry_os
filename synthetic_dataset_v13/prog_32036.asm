; DESCRIPTION: Composite: Places a purple dot at position (146, 209) then Creates a blue circular shape at (231, 181) with radius 64.
; PLAN: r0=146(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=181(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 181
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
