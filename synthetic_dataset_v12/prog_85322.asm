; DESCRIPTION: Draws a green line from (103, 243) to (387, 192).
; PLAN: r0=103(x1), r1=243(y1), r2=387(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 243
LDI r2, 387
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
