; DESCRIPTION: Composite: Places a blue line segment connecting (237, 188) to (507, 140) then Places a cyan dot at position (488, 165).
; PLAN: r0=237(x1), r1=188(y1), r2=507(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=165(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 188
LDI r2, 507
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 165
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
