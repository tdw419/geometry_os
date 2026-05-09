; DESCRIPTION: Draws a green line from (445, 45) to (328, 137).
; PLAN: r0=445(x1), r1=45(y1), r2=328(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 45
LDI r2, 328
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
