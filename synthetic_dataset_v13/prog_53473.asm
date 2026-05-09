; DESCRIPTION: Draws a red line from (392, 50) to (243, 243).
; PLAN: r0=392(x1), r1=50(y1), r2=243(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 50
LDI r2, 243
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
