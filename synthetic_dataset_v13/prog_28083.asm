; DESCRIPTION: Draws a cyan line from (415, 19) to (468, 210).
; PLAN: r0=415(x1), r1=19(y1), r2=468(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 19
LDI r2, 468
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
