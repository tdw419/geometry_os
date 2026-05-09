; DESCRIPTION: Composite: Places a cyan line segment connecting (119, 237) to (414, 200) then Places a blue dot at position (152, 132).
; PLAN: r0=119(x1), r1=237(y1), r2=414(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=132(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 237
LDI r2, 414
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 132
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
