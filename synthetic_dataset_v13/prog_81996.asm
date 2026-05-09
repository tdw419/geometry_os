; DESCRIPTION: Composite: Renders a cyan line between points (221, 164) and (61, 82) then Places a cyan circle of radius 17 at center (25, 18).
; PLAN: r0=221(x1), r1=164(y1), r2=61(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=18(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 164
LDI r2, 61
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 18
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
