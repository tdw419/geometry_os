; DESCRIPTION: Draws a cyan line from (415, 2) to (124, 125).
; PLAN: r0=415(x1), r1=2(y1), r2=124(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 2
LDI r2, 124
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
