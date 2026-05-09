; DESCRIPTION: Composite: Creates a cyan circular shape at (231, 103) with radius 64 then Renders a magenta line between points (343, 165) and (105, 143).
; PLAN: r0=231(x), r1=103(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=165(y1), r7=105(x2), r8=143(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 103
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 165
LDI r7, 105
LDI r8, 143
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
