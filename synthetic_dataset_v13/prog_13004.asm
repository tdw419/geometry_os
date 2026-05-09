; DESCRIPTION: Draws a cyan line from (16, 137) to (404, 125).
; PLAN: r0=16(x1), r1=137(y1), r2=404(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 137
LDI r2, 404
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
