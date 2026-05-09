; DESCRIPTION: Draws a cyan line from (152, 115) to (400, 18).
; PLAN: r0=152(x1), r1=115(y1), r2=400(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 400
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
