; DESCRIPTION: Draws a red line from (173, 28) to (487, 143).
; PLAN: r0=173(x1), r1=28(y1), r2=487(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 28
LDI r2, 487
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
