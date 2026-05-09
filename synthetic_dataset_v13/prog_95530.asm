; DESCRIPTION: Renders a cyan line between points (437, 153) and (275, 16).
; PLAN: r0=437(x1), r1=153(y1), r2=275(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 153
LDI r2, 275
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
