; DESCRIPTION: Draws a black line from (154, 27) to (37, 146).
; PLAN: r0=154(x1), r1=27(y1), r2=37(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 27
LDI r2, 37
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
