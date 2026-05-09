; DESCRIPTION: Draws a cyan line from (428, 77) to (168, 142).
; PLAN: r0=428(x1), r1=77(y1), r2=168(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 77
LDI r2, 168
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
