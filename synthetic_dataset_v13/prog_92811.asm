; DESCRIPTION: Renders a black line between points (94, 228) and (340, 3).
; PLAN: r0=94(x1), r1=228(y1), r2=340(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 228
LDI r2, 340
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
