; DESCRIPTION: Draws a red line from (416, 47) to (202, 231).
; PLAN: r0=416(x1), r1=47(y1), r2=202(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 47
LDI r2, 202
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
