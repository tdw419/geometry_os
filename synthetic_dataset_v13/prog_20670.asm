; DESCRIPTION: Places a magenta line segment connecting (197, 214) to (298, 239).
; PLAN: r0=197(x1), r1=214(y1), r2=298(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 214
LDI r2, 298
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
