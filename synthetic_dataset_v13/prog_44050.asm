; DESCRIPTION: Places a red line segment connecting (146, 206) to (394, 54).
; PLAN: r0=146(x1), r1=206(y1), r2=394(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 206
LDI r2, 394
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
