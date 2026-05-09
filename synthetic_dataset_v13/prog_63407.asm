; DESCRIPTION: Draws a white line from (242, 16) to (167, 131).
; PLAN: r0=242(x1), r1=16(y1), r2=167(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 16
LDI r2, 167
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
