; DESCRIPTION: Composite: Renders a purple box of size 61x71 starting at (21, 131) then Sets a single cyan pixel at (493, 249).
; PLAN: r0=21(x), r1=131(y), r2=61(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=493(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 131
LDI r2, 61
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
