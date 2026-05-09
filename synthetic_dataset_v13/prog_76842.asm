; DESCRIPTION: Draws a cyan line from (380, 247) to (444, 87).
; PLAN: r0=380(x1), r1=247(y1), r2=444(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 247
LDI r2, 444
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
