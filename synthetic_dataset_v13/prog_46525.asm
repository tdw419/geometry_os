; DESCRIPTION: Draws a white line from (123, 53) to (446, 242).
; PLAN: r0=123(x1), r1=53(y1), r2=446(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 53
LDI r2, 446
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
