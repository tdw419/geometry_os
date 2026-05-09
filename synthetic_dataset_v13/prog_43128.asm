; DESCRIPTION: Draws a red line from (124, 168) to (294, 182).
; PLAN: r0=124(x1), r1=168(y1), r2=294(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 168
LDI r2, 294
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
