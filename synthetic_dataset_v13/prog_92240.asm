; DESCRIPTION: Draws a white line from (30, 141) to (202, 210).
; PLAN: r0=30(x1), r1=141(y1), r2=202(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 141
LDI r2, 202
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
