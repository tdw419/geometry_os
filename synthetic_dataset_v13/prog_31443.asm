; DESCRIPTION: Renders a cyan line between points (313, 68) and (428, 54).
; PLAN: r0=313(x1), r1=68(y1), r2=428(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 68
LDI r2, 428
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
