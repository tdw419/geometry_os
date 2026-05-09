; DESCRIPTION: Renders a cyan line between points (327, 77) and (428, 113).
; PLAN: r0=327(x1), r1=77(y1), r2=428(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 77
LDI r2, 428
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
