; DESCRIPTION: Draws a cyan line from (342, 27) to (372, 120).
; PLAN: r0=342(x1), r1=27(y1), r2=372(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 27
LDI r2, 372
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
