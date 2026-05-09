; DESCRIPTION: Draws a cyan line from (411, 103) to (392, 163).
; PLAN: r0=411(x1), r1=103(y1), r2=392(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 103
LDI r2, 392
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
