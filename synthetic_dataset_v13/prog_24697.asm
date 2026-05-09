; DESCRIPTION: Draws a white line from (180, 54) to (298, 197).
; PLAN: r0=180(x1), r1=54(y1), r2=298(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 54
LDI r2, 298
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
