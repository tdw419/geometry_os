; DESCRIPTION: Draws a cyan line from (486, 60) to (167, 48).
; PLAN: r0=486(x1), r1=60(y1), r2=167(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 60
LDI r2, 167
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
