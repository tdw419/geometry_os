; DESCRIPTION: Composite: Renders a purple box of size 112x19 starting at (232, 82) then Sets a single cyan pixel at (226, 29).
; PLAN: r0=232(x), r1=82(y), r2=112(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=29(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 82
LDI r2, 112
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 29
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
