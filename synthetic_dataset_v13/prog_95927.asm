; DESCRIPTION: Places a red line segment connecting (328, 164) to (502, 91).
; PLAN: r0=328(x1), r1=164(y1), r2=502(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 164
LDI r2, 502
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
