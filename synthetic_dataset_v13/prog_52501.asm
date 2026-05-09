; DESCRIPTION: Composite: Draws a green line from (331, 68) to (292, 254) then Places a cyan circle of radius 13 at center (330, 92).
; PLAN: r0=331(x1), r1=68(y1), r2=292(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=92(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 331
LDI r1, 68
LDI r2, 292
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 92
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
