; DESCRIPTION: Composite: Places a black circle of radius 39 at center (236, 69) then Draws a black line from (215, 13) to (393, 20).
; PLAN: r0=236(x), r1=69(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=13(y1), r7=393(x2), r8=20(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 69
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 13
LDI r7, 393
LDI r8, 20
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
