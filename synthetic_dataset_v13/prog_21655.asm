; DESCRIPTION: Draws a green line from (404, 31) to (217, 64).
; PLAN: r0=404(x1), r1=31(y1), r2=217(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 31
LDI r2, 217
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
