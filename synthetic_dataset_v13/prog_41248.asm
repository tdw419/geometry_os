; DESCRIPTION: Draws a green line from (277, 226) to (404, 50).
; PLAN: r0=277(x1), r1=226(y1), r2=404(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 226
LDI r2, 404
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
