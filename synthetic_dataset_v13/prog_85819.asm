; DESCRIPTION: Composite: Places a blue dot at position (300, 229) then Draws a white line from (45, 173) to (492, 175).
; PLAN: r0=300(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=173(y1), r7=492(x2), r8=175(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 173
LDI r7, 492
LDI r8, 175
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
