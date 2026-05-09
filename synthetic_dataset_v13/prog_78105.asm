; DESCRIPTION: Draws a cyan line from (277, 112) to (464, 40).
; PLAN: r0=277(x1), r1=112(y1), r2=464(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 112
LDI r2, 464
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
