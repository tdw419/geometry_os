; DESCRIPTION: Draws a red line from (354, 244) to (387, 190).
; PLAN: r0=354(x1), r1=244(y1), r2=387(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 244
LDI r2, 387
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
