; DESCRIPTION: Composite: Places a black circle of radius 47 at center (410, 196) then Renders a yellow line between points (214, 226) and (200, 55).
; PLAN: r0=410(x), r1=196(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=226(y1), r7=200(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 196
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 226
LDI r7, 200
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
