; DESCRIPTION: Composite: Places a white circle of radius 16 at center (25, 60) then Renders a blue line between points (45, 102) and (433, 6).
; PLAN: r0=25(x), r1=60(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=102(y1), r7=433(x2), r8=6(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 60
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 102
LDI r7, 433
LDI r8, 6
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
