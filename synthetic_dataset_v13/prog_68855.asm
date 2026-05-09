; DESCRIPTION: Draws a green line from (398, 123) to (474, 174).
; PLAN: r0=398(x1), r1=123(y1), r2=474(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 123
LDI r2, 474
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
