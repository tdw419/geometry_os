; DESCRIPTION: Composite: Renders a magenta box of size 72x104 starting at (385, 64) then Sets a single purple pixel at (472, 112).
; PLAN: r0=385(x), r1=64(y), r2=72(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=112(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 64
LDI r2, 72
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 112
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
