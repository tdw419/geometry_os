; DESCRIPTION: Composite: Draws a white line from (181, 128) to (341, 215) then Places a magenta circle of radius 32 at center (387, 220).
; PLAN: r0=181(x1), r1=128(y1), r2=341(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=220(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 128
LDI r2, 341
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 220
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
