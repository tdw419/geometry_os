; DESCRIPTION: Composite: Renders a purple box of size 108x74 starting at (50, 0) then Sets a single purple pixel at (435, 15).
; PLAN: r0=50(x), r1=0(y), r2=108(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 0
LDI r2, 108
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
