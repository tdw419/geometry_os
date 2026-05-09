; DESCRIPTION: Draws a cyan line from (464, 201) to (331, 55).
; PLAN: r0=464(x1), r1=201(y1), r2=331(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 201
LDI r2, 331
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
