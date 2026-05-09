; DESCRIPTION: Draws a white line from (380, 62) to (242, 33).
; PLAN: r0=380(x1), r1=62(y1), r2=242(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 62
LDI r2, 242
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
