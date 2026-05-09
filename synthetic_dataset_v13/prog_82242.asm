; DESCRIPTION: Composite: Renders a yellow disk with center (256, 108) and radius 28 then Places a magenta dot at position (32, 124) then Places a yellow line segment connecting (111, 63) to (52, 150).
; PLAN: r0=256(x), r1=108(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=124(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=63(y1), r12=52(x2), r13=150(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 108
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 124
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 63
LDI r12, 52
LDI r13, 150
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
