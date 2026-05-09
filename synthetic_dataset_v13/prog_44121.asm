; DESCRIPTION: Draws a green line from (502, 47) to (298, 95).
; PLAN: r0=502(x1), r1=47(y1), r2=298(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 47
LDI r2, 298
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
