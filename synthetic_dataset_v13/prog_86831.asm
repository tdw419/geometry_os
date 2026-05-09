; DESCRIPTION: Draws a black line from (387, 28) to (242, 5).
; PLAN: r0=387(x1), r1=28(y1), r2=242(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 28
LDI r2, 242
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
