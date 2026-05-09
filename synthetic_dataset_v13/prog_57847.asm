; DESCRIPTION: Composite: Places a cyan line segment connecting (69, 171) to (170, 176) then Places a black circle of radius 18 at center (236, 193).
; PLAN: r0=69(x1), r1=171(y1), r2=170(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=193(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 171
LDI r2, 170
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 193
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
