; DESCRIPTION: Draws a magenta line from (480, 18) to (298, 177).
; PLAN: r0=480(x1), r1=18(y1), r2=298(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 18
LDI r2, 298
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
