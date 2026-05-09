; DESCRIPTION: Draws a cyan line from (388, 21) to (412, 220).
; PLAN: r0=388(x1), r1=21(y1), r2=412(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 21
LDI r2, 412
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
