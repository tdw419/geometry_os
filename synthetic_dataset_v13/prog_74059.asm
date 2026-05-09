; DESCRIPTION: Composite: Renders a cyan line between points (115, 61) and (265, 196) then Places a red circle of radius 55 at center (291, 125).
; PLAN: r0=115(x1), r1=61(y1), r2=265(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=125(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 61
LDI r2, 265
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 125
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
