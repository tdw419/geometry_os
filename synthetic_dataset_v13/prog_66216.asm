; DESCRIPTION: Draws a cyan line from (392, 153) to (387, 54).
; PLAN: r0=392(x1), r1=153(y1), r2=387(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 153
LDI r2, 387
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
