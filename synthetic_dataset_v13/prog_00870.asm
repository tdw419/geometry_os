; DESCRIPTION: Composite: Draws a white line from (289, 205) to (75, 108) then Places a blue circle of radius 61 at center (218, 117).
; PLAN: r0=289(x1), r1=205(y1), r2=75(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=117(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 205
LDI r2, 75
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 117
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
