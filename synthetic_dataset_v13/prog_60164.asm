; DESCRIPTION: Composite: Renders a purple box of size 120x16 starting at (60, 134) then Sets a single purple pixel at (60, 144).
; PLAN: r0=60(x), r1=134(y), r2=120(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=144(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 134
LDI r2, 120
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 144
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
