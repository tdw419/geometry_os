; DESCRIPTION: Composite: Renders a magenta box of size 59x68 starting at (96, 162) then Sets a single magenta pixel at (250, 225).
; PLAN: r0=96(x), r1=162(y), r2=59(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=225(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 162
LDI r2, 59
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 225
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
