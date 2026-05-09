; DESCRIPTION: Draws a white line from (146, 59) to (174, 240).
; PLAN: r0=146(x1), r1=59(y1), r2=174(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 59
LDI r2, 174
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
