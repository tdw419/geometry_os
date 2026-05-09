; DESCRIPTION: Draws a cyan line from (127, 153) to (422, 237).
; PLAN: r0=127(x1), r1=153(y1), r2=422(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 153
LDI r2, 422
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
