; DESCRIPTION: Draws a black line from (228, 7) to (298, 192).
; PLAN: r0=228(x1), r1=7(y1), r2=298(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 7
LDI r2, 298
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
