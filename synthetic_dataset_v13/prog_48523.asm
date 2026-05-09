; DESCRIPTION: Composite: Draws a cyan rectangle at (219, 153) with width 102 and height 103 then Sets a single blue pixel at (133, 221).
; PLAN: r0=219(x), r1=153(y), r2=102(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 219
LDI r1, 153
LDI r2, 102
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
