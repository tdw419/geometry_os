; DESCRIPTION: Composite: Renders a red box of size 55x120 starting at (196, 11) then Sets a single purple pixel at (386, 114).
; PLAN: r0=196(x), r1=11(y), r2=55(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=114(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 11
LDI r2, 55
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 114
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
