; DESCRIPTION: Draws a cyan line from (395, 204) to (415, 55).
; PLAN: r0=395(x1), r1=204(y1), r2=415(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 204
LDI r2, 415
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
