; DESCRIPTION: Composite: Creates a green circular shape at (231, 236) with radius 12 then Draws a magenta line from (115, 168) to (480, 163) then Places a magenta dot at position (83, 177).
; PLAN: r0=231(x), r1=236(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=168(y1), r7=480(x2), r8=163(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=177(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 236
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 168
LDI r7, 480
LDI r8, 163
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 177
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
