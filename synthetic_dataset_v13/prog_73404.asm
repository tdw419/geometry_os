; DESCRIPTION: Draws a red line from (206, 206) to (295, 182).
; PLAN: r0=206(x1), r1=206(y1), r2=295(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 206
LDI r2, 295
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
