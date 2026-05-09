; DESCRIPTION: Composite: Renders a cyan line between points (475, 141) and (326, 3) then Places a green circle of radius 33 at center (397, 82).
; PLAN: r0=475(x1), r1=141(y1), r2=326(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=82(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 141
LDI r2, 326
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 82
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
