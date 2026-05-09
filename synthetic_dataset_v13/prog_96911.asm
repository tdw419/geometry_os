; DESCRIPTION: Draws a white line from (242, 1) to (327, 176).
; PLAN: r0=242(x1), r1=1(y1), r2=327(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 1
LDI r2, 327
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
