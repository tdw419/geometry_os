; DESCRIPTION: Composite: Places a green line segment connecting (402, 146) to (28, 73) then Places a blue dot at position (123, 79).
; PLAN: r0=402(x1), r1=146(y1), r2=28(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=79(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 146
LDI r2, 28
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 79
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
