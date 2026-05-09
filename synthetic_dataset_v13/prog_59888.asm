; DESCRIPTION: Composite: Renders a purple box of size 120x16 starting at (72, 111) then Sets a single blue pixel at (263, 162).
; PLAN: r0=72(x), r1=111(y), r2=120(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=162(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 111
LDI r2, 120
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 162
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
