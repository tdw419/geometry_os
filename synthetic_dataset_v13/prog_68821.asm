; DESCRIPTION: Draws a white line from (470, 228) to (22, 239).
; PLAN: r0=470(x1), r1=228(y1), r2=22(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 228
LDI r2, 22
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
