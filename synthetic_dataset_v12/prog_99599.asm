; DESCRIPTION: Draws a cyan line from (77, 132) to (433, 125).
; PLAN: r0=77(x1), r1=132(y1), r2=433(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 132
LDI r2, 433
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
