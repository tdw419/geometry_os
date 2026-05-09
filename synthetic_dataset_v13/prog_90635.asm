; DESCRIPTION: Composite: Renders a magenta disk with center (100, 87) and radius 69 then Draws a black line from (307, 56) to (404, 33) then Places a magenta dot at position (132, 242).
; PLAN: r0=100(x), r1=87(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=56(y1), r7=404(x2), r8=33(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=242(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 87
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 56
LDI r7, 404
LDI r8, 33
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 242
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
