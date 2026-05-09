; DESCRIPTION: Composite: Places a cyan dot at position (273, 168) then Renders a magenta disk with center (411, 83) and radius 64 then Places a blue line segment connecting (61, 64) to (231, 45).
; PLAN: r0=273(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=83(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x1), r11=64(y1), r12=231(x2), r13=45(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 83
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 64
LDI r12, 231
LDI r13, 45
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
