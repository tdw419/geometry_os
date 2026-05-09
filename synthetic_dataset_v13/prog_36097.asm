; DESCRIPTION: Draws a green line from (392, 206) to (218, 78).
; PLAN: r0=392(x1), r1=206(y1), r2=218(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 206
LDI r2, 218
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
