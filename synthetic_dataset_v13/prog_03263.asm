; DESCRIPTION: Draws a cyan line from (487, 20) to (57, 202).
; PLAN: r0=487(x1), r1=20(y1), r2=57(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 20
LDI r2, 57
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
