; DESCRIPTION: Composite: Renders a white line between points (178, 33) and (196, 164) then Places a cyan circle of radius 41 at center (352, 110).
; PLAN: r0=178(x1), r1=33(y1), r2=196(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=110(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 33
LDI r2, 196
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 110
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
