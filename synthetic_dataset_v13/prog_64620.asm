; DESCRIPTION: Draws a black line from (242, 168) to (63, 14).
; PLAN: r0=242(x1), r1=168(y1), r2=63(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 168
LDI r2, 63
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
